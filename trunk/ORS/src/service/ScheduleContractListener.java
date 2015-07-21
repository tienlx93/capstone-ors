package service;

import org.joda.time.Period;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleTrigger;
import org.quartz.impl.JobDetailImpl;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.triggers.SimpleTriggerImpl;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.Date;

/**
 * Created by xps on 7/20/2015.
 */
@WebListener
public class ScheduleContractListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //Creating scheduler factory and scheduler
        SchedulerFactory factory = new StdSchedulerFactory();
        Scheduler scheduler = null;
        try {
            scheduler = factory.getScheduler();

            //Creating Job and link to our Job class
            JobDetailImpl jobDetail = new JobDetailImpl();
            jobDetail.setName("Second Job");
            jobDetail.setJobClass(ScheduleCheckContract.class);

            //Creating schedule time with trigger
            SimpleTriggerImpl simpleTrigger = new SimpleTriggerImpl();
            simpleTrigger.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
            int duration = Period.minutes(1).getMillis();
            simpleTrigger.setRepeatInterval(5000);
            simpleTrigger.setName("SecondTrigger");

            //Start scheduler
            scheduler.start();
            scheduler.scheduleJob(jobDetail, simpleTrigger);
        } catch (SchedulerException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("On shutdown web app");
    }

}

