package service;

import dao.AccountDAO;
import dao.AppointmentDAO;
import dao.RentalDAO;
import dao.RepairDAO;
import entity.Account;
import entity.Appointment;
import entity.Rental;
import entity.Repair;
import json.CalendarItemJSON;
import json.CalendarJSON;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ASUS on 7/4/2015.
 */
public class ScheduleService {
    private Calendar calendar;
    private List<Account> staffList;
    private Map<String, List<Date>> dateMap;
    private AppointmentDAO appointmentDAO;
    private RentalDAO rentalDAO;
    private RepairDAO repairDAO;
    private Date startDate;
    private Date endDate;

    public ScheduleService() {
        calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        startDate = calendar.getTime();
        calendar.add(Calendar.DATE, 7);
        endDate = calendar.getTime();
        dateMap = new HashMap<>();

        staffList = new AccountDAO().findStaff();
        appointmentDAO = new AppointmentDAO();
        rentalDAO = new RentalDAO();
        repairDAO = new RepairDAO();
        List<Date> staffDate;
        String staffUsername;
        for (Account staff : staffList) {
            staffUsername = staff.getUsername();
            staffDate = new ArrayList<>();


            //appointment by assigned staff
            for (Appointment appointment : appointmentDAO.getAppointmentListByStaffInRange(staffUsername, startDate, endDate)) {
                staffDate.add(appointment.getTime());
            }

            for (Rental rental : rentalDAO.getRentalListByStaffInRange(staffUsername, startDate, endDate)) {
                staffDate.add(rental.getAssignedTime());
            }

            for (Repair repair : repairDAO.getRepairListByStaffInRange(staffUsername, startDate, endDate)) {
                staffDate.add(repair.getAssignedTime());
                staffDate.add(repair.getAssignedTime());
            }
            dateMap.put(staffUsername, staffDate);
        }

    }

    /**
     *
     * @return HashMap of unassigned appointment to staff
     */
    public Map<Integer, String> makeAppointmentSchedule() {
        Map<Integer, String> result = new HashMap<>();
        List<Appointment> appointmentList = appointmentDAO.getAppointmentListByStatus(1);
        int staffCount = staffList.size();
        int jobCount = appointmentList.size();


        List<Account> availableStaff;
        //Loop in unassigned appointment
        for (Appointment appointment : appointmentList) {
            if ((appointment.getTime().after(startDate) || appointment.getTime().equals(startDate))
                    && appointment.getTime().before(endDate)) {
                availableStaff = new ArrayList<>();
                for (Account account : staffList) {
                    availableStaff.add(account);
                }
                String assignedStaff = assignAppointmentInStaffList(availableStaff, appointment);
                if (assignedStaff != null) {
                    result.put(appointment.getId(), assignedStaff);
                } else {
                    result.put(appointment.getId(), "");
                }
            }

        }


        return result;
    }

    /**
     * @param availableStaff
     * @param appointment
     * @return
     */
    private String assignAppointmentInStaffList(List<Account> availableStaff, Appointment appointment) {
        if (availableStaff.size() > 0) {
            //Loop in available staff
            int min = Integer.MAX_VALUE;
            Account tbd = availableStaff.get(0);
            List<Date> jobDateList = dateMap.get(tbd.getUsername());
            for (Account account : availableStaff) {
                if (min > dateMap.get(account.getUsername()).size()) {
                    min = dateMap.get(account.getUsername()).size();
                    //set the tbd account to the staff has least job in week
                    tbd = account;
                    jobDateList = dateMap.get(account.getUsername());
                }
            }

            // Check the number of job in the day of staff
            int jobInDate = 0;
            Date dayStart = getStartOfDay(appointment.getTime());
            Date dayEnd = getEndOfDay(appointment.getTime());
            for (Date date : jobDateList) {
                if ((date.after(dayStart) || date.equals(dayStart)) && date.before(dayEnd)) {
                    jobInDate++;
                }
            }

            // If number of job >= 4, remove the staff from the list, and re calculate the available staff
            if (jobInDate >= 4) {
                availableStaff.remove(tbd);
                return assignAppointmentInStaffList(availableStaff, appointment);
            } else {
                //Else the staff is available, assign the job to the staff
                System.out.println("Assign success: appointment at " + appointment.getTime() +
                        "\n     staff: " + tbd.getUsername());
                jobDateList.add(appointment.getTime());
                return tbd.getUsername();
            }
        } else {
            System.out.println("Assign fail");
            return null;
        }
    }

    private Date getEndOfDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.set(Calendar.MILLISECOND, 999);
        return calendar.getTime();
    }

    private Date getStartOfDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    public Calendar getCalendar() {
        return calendar;
    }

    public void setCalendar(Calendar calendar) {
        this.calendar = calendar;
    }

    public List<Account> getStaffList() {
        return staffList;
    }

    public void setStaffList(List<Account> staffList) {
        this.staffList = staffList;
    }

    public Map<String, List<Date>> getDateMap() {
        return dateMap;
    }

    public void setDateMap(Map<String, List<Date>> dateMap) {
        this.dateMap = dateMap;
    }
}
