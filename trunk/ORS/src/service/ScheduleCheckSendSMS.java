package service;

import dao.AppointmentDAO;
import dao.RepairDAO;
import entity.Appointment;
import entity.Repair;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.Date;
import java.util.List;

/**
 * Created by xps on 7/16/2015.
 */
public class ScheduleCheckSendSMS implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        AppointmentDAO appointmentDAO = new AppointmentDAO();
        List<Appointment> appointments = appointmentDAO.getAppointmentListByStatus(3);
        List<Appointment> appointmentRejects = appointmentDAO.getAppointmentListByStatus(5);

        Date date = new Date();
        long currentDate = date.getTime();

        for (Appointment reject : appointmentRejects) {
            System.out.println(reject.getId());
        }

        for (Appointment appointment : appointments) {
            long endDate = appointment.getTime().getTime();
            long dayTime = (endDate - currentDate) / (24 * 60 * 60 * 1000);

            if(dayTime == 2) {
                System.out.println(appointment.getId());
            }
        }

        RepairDAO repairDAO = new RepairDAO();
        List<Repair> repairs = repairDAO.getRepairListByStatus(2);
        List<Repair> repairRejects = repairDAO.getRepairListByStatus(4);

        for (Repair reject : repairRejects) {
            System.out.println(reject.getId());
        }

        for (Repair repair : repairs) {
            long endDate = repair.getAssignedTime().getTime();

            long dayTime = (endDate - currentDate) / (24 * 60 * 60 * 1000);

            if(dayTime == 2) {
                System.out.println(repair.getId());
            }
        }

    }
}
