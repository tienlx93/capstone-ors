package service;

import dao.*;
import entity.*;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.util.List;

public class scheduleDate implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        RequestOfficeDAO dao = new RequestOfficeDAO();
        List<RequestOffice> requests = dao.findAll();

        for (RequestOffice request : requests) {
            System.out.println(request.getCustomerUsername());
        }
    }

}
