package service;

import dao.AppointmentDAO;
import entity.Appointment;
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
        List<Appointment> appointments = appointmentDAO.getAppointmentListSendSMS();

        Date date = new Date();

        for (Appointment appointment : appointments) {
            long currentDate = date.getTime();
            long endDate = appointment.getTime().getTime();

            long dayTime = (endDate - currentDate) / (24 * 60 * 60 * 1000);

            if(dayTime == 2) {
                System.out.println(appointment.getId());
            }
        }

    }
}
