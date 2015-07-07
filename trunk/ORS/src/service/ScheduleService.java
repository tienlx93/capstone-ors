package service;

import dao.AccountDAO;
import dao.AppointmentDAO;
import dao.RentalDAO;
import dao.RepairDAO;
import entity.*;
import org.hibernate.Session;

import java.sql.Timestamp;
import java.util.*;

/**
 * Created by ASUS on 7/4/2015.
 */
public class ScheduleService {
    private Session session;
    private Calendar calendar;
    private List<Account> staffList;
    private Map<String, List<Date>> dateMap;
    private AppointmentDAO appointmentDAO;
    private RentalDAO rentalDAO;
    private RepairDAO repairDAO;
    private Date startDate;
    private Date endDate;

    public ScheduleService() {
        session = util.HibernateUtil.getSession();
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
     * Make the HashMap of unassigned appointment with available staff
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
                String assignedStaff = assignJob(availableStaff, appointment, null, null);
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
     *
     * @return HashMap of unassigned repair to staff
     */
    public Map<Integer, Repair> makeRepairSchedule() {
        Map<Integer, Repair> result = new HashMap<>();
        List<Repair> repairList = repairDAO.getRepairListByStatus(1);

        List<Account> availableStaff;
        int priority;
        Date today = new Date();
        Date assignedDate;
        //Loop in unassigned appointment
        for (Repair repair : repairList) {
            priority = 0;
            // Check if in repair list has item that has priority 1, set the repair priority to 1
            for (RepairDetail detail : repair.getRepairDetailsById()) {
                if (detail.getAmenityByAmenityId().getPriority() != null && detail.getAmenityByAmenityId().getPriority() == 1){
                    priority = 1;
                }
            }
            //if priority 1, set job in today, else set in weekend
            if (priority == 1) {
                assignedDate = today;
            } else {
                assignedDate = getNextDay(endDate, -2);
            }

            //Check if repair in week, try to assign
            if ((repair.getCreateTime().after(startDate) || repair.getCreateTime().equals(startDate))
                    && repair.getCreateTime().before(endDate)) {
                availableStaff = new ArrayList<>();
                for (Account account : staffList) {
                    availableStaff.add(account);
                }
                repair.setAssignedTime(new Timestamp(assignedDate.getTime()));
                String assignedStaff = assignRepairRental(availableStaff, repair, null);
                if (assignedStaff != null) {
                    repair.setAssignedStaff(assignedStaff);
                    result.put(repair.getId(), repair);
                } else {
                    result.put(repair.getId(), null);
                }
            }

        }
        return result;
    }

    /**
     *
     * @return HashMap of unassigned repair to staff
     */
    public Map<Integer, Rental> makeRentalSchedule() {
        Map<Integer, Rental> result = new HashMap<>();
        List<Rental> rentalList = rentalDAO.getRentalListByStatus(1);

        List<Account> availableStaff;

        //Loop in unassigned rental
        for (Rental rental : rentalList) {

            Date assignedDate = getNextDay(endDate, -2);
            //Check if repair in week, try to assign
            if ((rental.getCreateTime().after(startDate) || rental.getCreateTime().equals(startDate))
                    && rental.getCreateTime().before(endDate)) {
                availableStaff = new ArrayList<>();
                for (Account account : staffList) {
                    availableStaff.add(account);
                }
                rental.setAssignedTime(new Timestamp(assignedDate.getTime()));
                String assignedStaff = assignRepairRental(availableStaff, null, rental);
                if (assignedStaff != null) {
                    rental.setAssignStaff(assignedStaff);
                    result.put(rental.getId(), rental);
                } else {
                    result.put(rental.getId(), null);
                }
            }

        }
        return result;
    }


    /**
     * @param availableStaff
     * @param appointment
     * @return String of username for appointment
     */
    private String assignJob(List<Account> availableStaff, Appointment appointment, Repair repair, Rental rental) {
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
            Date dayStart;
            Date dayEnd;
            int jobsAvailable;
            if (appointment != null) {
                dayStart = getStartOfDay(appointment.getTime());
                dayEnd = getEndOfDay(appointment.getTime());
                jobsAvailable = 4;
            } else if (repair != null) {
                dayStart = getStartOfDay(repair.getAssignedTime());
                dayEnd = getEndOfDay(repair.getAssignedTime());
                jobsAvailable = 3;
            } else {
                dayStart = getStartOfDay(rental.getAssignedTime());
                dayEnd = getEndOfDay(rental.getAssignedTime());
                jobsAvailable = 4;
            }

            for (Date date : jobDateList) {
                if ((date.after(dayStart) || date.equals(dayStart)) && date.before(dayEnd)) {
                    jobInDate++;
                }
            }

            // If number of job >= 4, remove the staff from the list, and re calculate the available staff
            if (jobInDate >= jobsAvailable) {
                availableStaff.remove(tbd);
                return assignJob(availableStaff, appointment, repair, rental);
            } else {
                //Else the staff is available, assign the job to the staff
                Date assignedTime;
                if (appointment != null) {
                    assignedTime = appointment.getTime();
                } else if (repair != null) {
                    assignedTime = repair.getAssignedTime();
                } else {
                    assignedTime = rental.getAssignedTime();
                }
                System.out.println("Assign success: appointment at " + assignedTime +
                        "\n     staff: " + tbd.getUsername());
                jobDateList.add(assignedTime);
                return tbd.getUsername();
            }
        } else {
            System.out.println("Assign fail");
            return null;
        }
    }

    private String assignRepairRental(List<Account> availableStaff, Repair repair, Rental rental) {
        Date assignedTime;
        if (repair!=null){
            assignedTime = repair.getAssignedTime();
        } else {
            assignedTime = rental.getAssignedTime();
        }
        //if the assign time in week, try to assign
        if (assignedTime.before(endDate)) {
            String assignedStaff = assignJob(availableStaff, null, repair, rental);
            if (assignedStaff != null) {
                return assignedStaff;
            } else {
                //Increase the assigned date by 1, try to assign again
                if (repair!=null){
                    repair.setAssignedTime(new Timestamp(getNextDay(repair.getAssignedTime(), 1).getTime()));
                } else if (rental != null) {
                    rental.setAssignedTime(new Timestamp(getNextDay(rental.getAssignedTime(), 1).getTime()));
                }
                return  assignRepairRental(availableStaff, repair, rental);
            }
        } else {
            // if assign time out of week, cannot assign
            return null;
        }
    }

    private Date getNextDay(Date date, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, day);
        return calendar.getTime();
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
