package service;

import dao.*;
import entity.*;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by xps on 9/13/2015.
 */
public class ScheduleCheckAppointment implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        AppointmentDAO appointmentDAO = new AppointmentDAO();
        List<Appointment> appointmentList = appointmentDAO.getAppointmentListByStatus(1);

        Date date = new Date();
        long currentDate = date.getTime();

        if(appointmentList != null && appointmentList.size() > 0) {
            for (Appointment appointment : appointmentList) {
                long time = appointment.getTime().getTime();

                if(currentDate > time) {
                    SMSService sms = new SMSService();
                    String phone = appointment.getAccountByCustomerUsername().getProfileByUsername().getPhone();
                    if(!phone.equals("")) {
                        sms.setPhone(phone);
                        sms.setMessage("(ORS) Lịch hẹn đã hết hạn xin quý khách vui lòng đăng ký lịch hẹn mới.");
                        appointmentDAO.updateStatus(appointment.getId(), 5);
                        try {
                            sms.send();
                        } catch (IOException e) {
                            System.out.println("Fail to send sms");
                        }
                        System.out.println(appointment.getId());
                    }
                }
            }


        }

    }
}
