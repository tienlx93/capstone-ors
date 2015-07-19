package service;

import dao.ContractDAO;
import entity.Contract;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


import java.util.Date;
import java.util.List;

/**
 * Created by xps on 7/17/2015.
 */
public class ScheduleCheckContract implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        ContractDAO dao = new ContractDAO();
        List<Contract> contractList = dao.getContractListAvailable();

        Date date = new Date();

        for (Contract contract : contractList) {
            long currentDate = date.getTime();
            long endDate = contract.getEndDate().getTime();

            long dayTime = (endDate - currentDate) / (24 * 60 * 60 * 1000);

            if (currentDate - endDate > 0){
                if(contract.getStatusId() == 1) {
                    dao.changeStatus(contract.getId(), 4);
                }
                System.out.println(contract.getId());
            } else if (dayTime == 7) {
                System.out.println(contract.getId());
            }
        }

    }
}

