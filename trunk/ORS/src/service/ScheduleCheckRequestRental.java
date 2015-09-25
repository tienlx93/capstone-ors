package service;

import dao.RentalDAO;
import dao.RepairDAO;
import entity.Rental;
import entity.Repair;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by xps on 9/23/2015.
 */
public class ScheduleCheckRequestRental implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        RentalDAO rentalDAO = new RentalDAO();
        List<Rental> rentalList = rentalDAO.getRentalListHasStatusOneAndTwo();

        Date date = new Date();
        long currentDate = date.getTime();

        if (rentalList != null && rentalList.size() > 0) {
            for (Rental rental : rentalList) {
                long time = rental.getCreateTime().getTime();
                if(rental.getStatusId() == 2) {
                    time = rental.getAssignedTime().getTime();
                }

                if (currentDate > time) {
                    SMSService sms = new SMSService();
                    String phone = rental.getContractByContractId().getAccountByCustomerUsername().getProfileByUsername().getPhone();
                    if (!phone.equals("")) {
                        sms.setPhone(phone);
                        sms.setMessage("(ORS) Yeu cau thue vat dung cua quy khach da het han.");
                        rentalDAO.changeStatus(rental.getId(), 4);
                        try {
                            sms.send();
                        } catch (IOException e) {
                            System.out.println("Fail to send sms");
                        }
                        System.out.println(rental.getId());
                    }
                }
            }


        }

    }
}
