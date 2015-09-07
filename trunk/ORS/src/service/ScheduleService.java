package service;

import dao.AccountDAO;
import dao.AppointmentDAO;
import dao.RentalDAO;
import dao.RepairDAO;
import entity.*;
import json.AssignResultJSON;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;
import org.joda.time.DateTime;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ASUS on 7/7/2015.
 */
public class ScheduleService {
    private Session session;
    private List<Account> staffList;
    private AppointmentDAO appointmentDAO;
    private RentalDAO rentalDAO;
    private RepairDAO repairDAO;
    private Date startDate;
    private Date endDate;
    private Map<String, Integer> weekJobCount;
    private Map<String, Map<String, Integer>> dayJobCount;
    private DateFormat df;

    public List<Account> getStaffList() {
        return staffList;
    }

    public ScheduleService() {
        session = util.HibernateUtil.getSession();
        Calendar calendar = Calendar.getInstance();
        startDate = getStartOfWeek(calendar);
        endDate = addDays(startDate, 7);

        staffList = new AccountDAO().findStaff();
        appointmentDAO = new AppointmentDAO();
        rentalDAO = new RentalDAO();
        repairDAO = new RepairDAO();
        dayJobCount = new HashMap<>();
        df = new SimpleDateFormat("yyyy-MM-dd");
    }

    public ScheduleService(Date start, Date end) {
        session = util.HibernateUtil.getSession();
        startDate = getStartOfDay(start);
        endDate = addDays(getStartOfDay(end), 1);

        staffList = new AccountDAO().findStaff();
        appointmentDAO = new AppointmentDAO();
        rentalDAO = new RentalDAO();
        repairDAO = new RepairDAO();
        dayJobCount = new HashMap<>();
        df = new SimpleDateFormat("yyyy-MM-dd");
    }

    public Date getStartOfWeek(Calendar calendar) {
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    public Map<Integer, String> makeAppointmentSchedule() {
        weekJobCount = getWeekJobCount(startDate, endDate);
        Map<Integer, String> result = new HashMap<>();
        List<Appointment> appointmentList = appointmentDAO.getAppointmentListByStatus(1);

        Date begin;
        Date end;
        List<String> availableStaff;
        String suggest = "";
        for (Appointment appointment : appointmentList) {
            begin = appointment.getTime();
            end = addDays(begin, 1);

            //Get appointment day's number of job
            availableStaff = getAvailableStaffInDate(begin, end);
            if (availableStaff.size() == 0) {
                result.put(appointment.getId(), "");
                break;
            }

            int min = Integer.MAX_VALUE;
            for (String staff : availableStaff) {
                if (weekJobCount.get(staff) < min) {
                    min = weekJobCount.get(staff);
                    suggest = staff;
                }
            }

            if (!suggest.equals("")) {
                increaseCounter(suggest, begin, 1);
                result.put(appointment.getId(), suggest);
            } else {
                result.put(appointment.getId(), "");
            }

        }

        return result;
    }

    public Map<Integer, Repair> makeRepairSchedule() {
        weekJobCount = getWeekJobCount(startDate, endDate);
        Map<Integer, Repair> result = new HashMap<>();
        List<Repair> repairList = repairDAO.getRepairListByStatus(2);
        Date begin = new Date();
        Date assigned;
        List<String> availableStaff;
        String suggest = "";
        int priority;

        for (Repair repair : repairList) {
            priority = 0;
            // Check if in repair list has item that has priority 1, set the repair priority to 1
            for (RepairDetail detail : repair.getRepairDetailsById()) {
                if (detail.getAmenityByAmenityId().getPriority() != null && detail.getAmenityByAmenityId().getPriority() == 1) {
                    priority = 1;
                }
            }
            //if priority 1, set job in today, else set in weekend
            if (priority == 1) {
                DateTime now = new DateTime();
                if (now.getHourOfDay() > 12) {
                    assigned = addDays(begin, 1);
                } else {
                    assigned = begin;
                }
            } else {
                assigned = addDays(endDate, -2);
            }

            //get available date
            do {
                availableStaff = getAvailableStaffInDate(assigned, addDays(assigned, 1));
                if (availableStaff.size() == 0) {
                    assigned = addDays(assigned, 1);
                }
            } while (assigned.after(endDate) || availableStaff.size() == 0);

            int min = Integer.MAX_VALUE;

            for (String staff : availableStaff) {
                if (weekJobCount.get(staff) < min) {
                    min = weekJobCount.get(staff);
                    suggest = staff;
                }
            }

            if (!suggest.equals("")) {
                increaseCounter(suggest, assigned, 2);
                repair.setAssignedStaff(suggest);
                repair.setAssignedTime(new Timestamp(getStartOfDay(assigned).getTime()));
                result.put(repair.getId(), repair);
            } else {
                result.put(repair.getId(), null);
            }
        }

        return result;
    }

    public Map<Integer, Rental> makeRentalSchedule() {
        weekJobCount = getWeekJobCount(startDate, endDate);
        Map<Integer, Rental> result = new HashMap<>();
        List<Rental> rentalList = rentalDAO.getRentalListByStatus(1);
        Date begin = addDays(endDate, -2);
        List<String> availableStaff;
        String suggest = "";

        for (Rental rental : rentalList) {
            //get available date
            do {
                availableStaff = getAvailableStaffInDate(begin, addDays(begin, 1));
                if (availableStaff.size() == 0) {
                    begin = addDays(begin, 1);
                }
            } while (begin.after(endDate) || availableStaff.size() == 0);

            int min = Integer.MAX_VALUE;
            for (String staff : availableStaff) {
                if (weekJobCount.get(staff) < min) {
                    min = weekJobCount.get(staff);
                    suggest = staff;
                }
            }

            if (!suggest.equals("")) {
                increaseCounter(suggest, begin, 1);
                rental.setAssignStaff(suggest);
                rental.setAssignedTime(new Timestamp(getStartOfDay(begin).getTime()));
                result.put(rental.getId(), rental);
            } else {
                result.put(rental.getId(), null);
            }
        }


        return result;
    }

    private List<String> getAvailableStaffInDate(Date begin, Date end) {
        Map<String, Integer> todayJobs;

        if (dayJobCount.get(df.format(begin)) == null) {
            todayJobs = getJobCountInRange(begin, end);
            dayJobCount.put(df.format(begin), todayJobs);
        } else {
            todayJobs = dayJobCount.get(df.format(begin));
        }

        List<String> availableStaff = new ArrayList<>();
        for (Account account : staffList) {
            if (todayJobs == null || todayJobs.size() == 0 || todayJobs.get(account.getUsername()) == null ||
                    todayJobs.get(account.getUsername()) < 4) {
                availableStaff.add(account.getUsername());
            }
        }
        return availableStaff;
    }

    public Map<String, Integer> getWeekJobCount(Date startDate, Date endDate) {
        Map<String, Integer> result = new HashMap<>();
        Map<String, Integer> weekJobCount = getJobCountInRange(startDate, endDate);

        for (Account staff : staffList) {
            if (weekJobCount != null && weekJobCount.get(staff.getUsername()) != null) {
                result.put(staff.getUsername(), weekJobCount.get(staff.getUsername()));
            } else {
                result.put(staff.getUsername(), 0);
            }

        }

        return result;
    }

    public Map<String, Integer> getJobCountInRange(Date startDate, Date endDate) {
        Map<String, Integer> result = new HashMap<>();
        Transaction trans = session.getTransaction();
        try {
            trans.begin();
            String sql = "exec GetJobCount :startDate, :endDate";
            SQLQuery query = session.createSQLQuery(sql)
                    .addScalar("Staff", StandardBasicTypes.STRING)
                    .addScalar("JobCount", StandardBasicTypes.INTEGER);
            query.setString("startDate", df.format(startDate));
            query.setString("endDate", df.format(endDate));

            List<Object[]> rows = query.list();
            for (Object[] row : rows) {
                result.put((String) row[0], (Integer) row[1]);
            }
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            e.printStackTrace();
        }
        return result;
    }

    private void increaseCounter(String suggest, Date begin, int number) {
        weekJobCount.put(suggest, weekJobCount.get(suggest) + number);
        Map<String, Integer> todayJobCount = dayJobCount.get(df.format(begin));
        todayJobCount.put(suggest, (todayJobCount.get(suggest) != null ? todayJobCount.get(suggest) : 0) + number);
    }

    public Date addDays(Date date, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, day);
        return calendar.getTime();
    }

    public Date getStartOfDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    public AssignResultJSON isStaffAvailable(Appointment appointment, String staff) {
        AssignResultJSON json = new AssignResultJSON();
        json.status = AssignResultJSON.STATUS_UNAVAILABLE_ALL;
        AccountDAO accountDAO = new AccountDAO();
        Account assignedStaff = accountDAO.get(staff);
        if (assignedStaff == null) {
            return json;
        }
        Date jobTime = appointment.getTime();
        Date startDate = getStartOfDay(jobTime);
        Date endDate = addDays(startDate, 1);
        json = calculateJob(startDate, endDate, staff, jobTime);
        return json;
    }

    public AssignResultJSON isStaffAvailable(Date jobTime, String staff) {
        AssignResultJSON json = new AssignResultJSON();
        json.status = AssignResultJSON.STATUS_UNAVAILABLE_ALL;
        AccountDAO accountDAO = new AccountDAO();
        Account assignedStaff = accountDAO.get(staff);
        if (assignedStaff == null) {
            return json;
        }
        Date startDate = getStartOfDay(jobTime);
        Date endDate = addDays(startDate, 1);
        json = calculateJob(startDate, endDate, staff, jobTime);
        return json;
    }

    private AssignResultJSON calculateJob(Date startDate, Date endDate, String staff, Date jobTime) {
        AssignResultJSON json = new AssignResultJSON();
        json.status = AssignResultJSON.STATUS_UNAVAILABLE_ALL;
        try {
            String sql = "exec GetDetailJob :startDate, :endDate, :staff";
            SQLQuery query = session.createSQLQuery(sql)
                    .addScalar("Id", StandardBasicTypes.INTEGER)
                    .addScalar("Time", StandardBasicTypes.TIMESTAMP)
                    .addScalar("Kind", StandardBasicTypes.INTEGER);
            query.setString("startDate", df.format(startDate));
            query.setString("endDate", df.format(endDate));
            query.setString("staff", staff);

            List<Object[]> rows = query.list();
            json.jobCount = rows.size();
            if (json.jobCount >= 6) {
                json.status = AssignResultJSON.STATUS_UNAVAILABLE_JOBCOUNT;
            } else if (json.jobCount >= 4) {
                json.status = AssignResultJSON.STATUS_CONFIRM;
            } else {
                json.status = AssignResultJSON.STATUS_AVAILABLE;
            }
            if (jobTime != null) {
                Timestamp dateTime;
                Date minDateTime = new Date();
                long different;
                long minDifferent = Long.MAX_VALUE;
                for (Object[] row : rows) {
                    if (row[2] == 1) {
                        dateTime = (Timestamp) row[1];
                        different = Math.abs(dateTime.getTime() - jobTime.getTime());
                        if (minDifferent > different) {
                            minDifferent = different;
                            minDateTime = dateTime;
                        }
                    }
                }
                double hoursDiff = (double) minDifferent / (3600 * 1000);
                if (hoursDiff <= 1) {
                    json.nearJob = minDateTime;
                    if (json.status >= 0) {
                        json.status = AssignResultJSON.STATUS_UNAVAILABLE_NEARJOB;
                    } else {
                        json.status = AssignResultJSON.STATUS_UNAVAILABLE_ALL;
                    }
                } else if (hoursDiff <= 2) {
                    json.nearJob = minDateTime;
                    if (json.status > 0) {
                        json.status = AssignResultJSON.STATUS_CONFIRM;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }
}
