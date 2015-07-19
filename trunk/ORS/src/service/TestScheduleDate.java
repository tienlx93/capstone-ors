package service;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleTrigger;
import org.quartz.impl.JobDetailImpl;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.triggers.SimpleTriggerImpl;

import java.util.Date;

/**
 * Created by xps on 7/14/2015.
 */
public class TestScheduleDate {
    public static void main(String args[]) throws SchedulerException {
        //Creating scheduler factory and scheduler
        SchedulerFactory factory = new StdSchedulerFactory();
        Scheduler scheduler = factory.getScheduler();

        //Creating Job and link to our Job class
        JobDetailImpl jobDetail = new JobDetailImpl();
        jobDetail.setName("First Job");
        jobDetail.setJobClass(ScheduleCheckRequestOffice.class);

        //Creating schedule time with trigger
        SimpleTriggerImpl simpleTrigger = new SimpleTriggerImpl();
        simpleTrigger.setStartTime(new Date(System.currentTimeMillis() + 1000));
        simpleTrigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
        simpleTrigger.setRepeatInterval(5000);
        simpleTrigger.setName("FirstTrigger");

        //Start scheduler
        scheduler.start();
        scheduler.scheduleJob(jobDetail, simpleTrigger);

    }

}


