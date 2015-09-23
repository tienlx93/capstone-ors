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
public class ScheduleCheckRequestRepair implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        RepairDAO repairDAO = new RepairDAO();
        List<Repair> repairList = repairDAO.getRepairListHasStatusOneAndTwo();

        Date date = new Date();
        long currentDate = date.getTime();

        if (repairList != null && repairList.size() > 0) {
            for (Repair repair : repairList) {
                long time = repair.getCreateTime().getTime();
                if(repair.getRepairStatusId() == 2) {
                    if(repair.getAssignedTime() != null) {
                        time = repair.getAssignedTime().getTime();
                    } else {
                        time = repair.getUpdateTime().getTime();
                    }
                }
                if (currentDate > time) {
                    SMSService sms = new SMSService();
                    String phone = repair.getContractByContractId().getAccountByCustomerUsername().getProfileByUsername().getPhone();
                    if (!phone.equals("")) {
                        sms.setPhone(phone);
                        sms.setMessage("(ORS) Yeu cau sua chua cua quy khach da het han.");
                        repairDAO.changeStatus(repair.getId(),5);
                        try {
                            sms.send();
                        } catch (IOException e) {
                            System.out.println("Fail to send sms");
                        }
                        System.out.println(repair.getId());
                    }
                }
            }


        }

    }
}

