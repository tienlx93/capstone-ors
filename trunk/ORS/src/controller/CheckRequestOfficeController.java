package controller;

import org.joda.time.Duration;
import org.quartz.*;
import org.quartz.impl.JobDetailImpl;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.triggers.SimpleTriggerImpl;
import service.ScheduleCheckRequestOffice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by xps on 7/21/2015.
 */
@WebServlet(name = "CheckRequestOfficeController", urlPatterns = {"/CheckRequestOffice"})
public class CheckRequestOfficeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SchedulerFactory factory = new StdSchedulerFactory();
        Scheduler scheduler = null;
        try {
            scheduler = factory.getScheduler();

            JobDetailImpl jobDetail1 = new JobDetailImpl();
            jobDetail1.setName("Check Request Office");
            jobDetail1.setJobClass(ScheduleCheckRequestOffice.class);

            SimpleTriggerImpl simpleTrigger1 = new SimpleTriggerImpl();
            simpleTrigger1.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger1.setRepeatCount(0);
            simpleTrigger1.setRepeatInterval(1000);
            simpleTrigger1.setName("CheckRequestTrigger");

            scheduler.start();
            scheduler.scheduleJob(jobDetail1, simpleTrigger1);

        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}
