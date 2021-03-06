package service;

import org.joda.time.DateTime;
import org.joda.time.Duration;
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
 * Created by xps on 7/21/2015.
 */
@WebListener
public class ScheduleListener implements ServletContextListener {
    private static SchedulerFactory factory = new StdSchedulerFactory();
    private static Scheduler scheduler = null;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //Creating scheduler factory and scheduler
        try {
            ConstantService constant = new ConstantService();

            scheduler = factory.getScheduler();

            JobDetailImpl jobDetail1 = new JobDetailImpl();
            jobDetail1.setName("First Job");
            jobDetail1.setJobClass(ScheduleCheckRequestOffice.class);

            //Creating schedule time with trigger
            SimpleTriggerImpl simpleTrigger1 = new SimpleTriggerImpl();
            simpleTrigger1.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger1.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
            String time = constant.readProperty("schedule.check_request_office");
            int minute;
            if (!time.equals("error")) {
                minute = Integer.parseInt(time);
            } else {
                minute = 1;
            }
            Long duration1 = Duration.standardMinutes(minute).getMillis();
            simpleTrigger1.setRepeatInterval(duration1);
            simpleTrigger1.setName("FirstTrigger");

            //Creating Job and link to our Job class
            JobDetailImpl jobDetail2 = new JobDetailImpl();
            jobDetail2.setName("Second Job");
            jobDetail2.setJobClass(ScheduleCheckContract.class);

            //Creating schedule time with trigger
            SimpleTriggerImpl simpleTrigger2 = new SimpleTriggerImpl();
            simpleTrigger2.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger2.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
            time = constant.readProperty("schedule.check_contract");
            if (!time.equals("error")) {
                minute = Integer.parseInt(time);
            } else {
                minute = 1;
            }
            Long duration2 = Duration.standardMinutes(minute).getMillis();
            simpleTrigger2.setRepeatInterval(duration2);
            simpleTrigger2.setName("SecondTrigger");

            //Creating Job and link to our Job class
            JobDetailImpl jobDetail3 = new JobDetailImpl();
            jobDetail3.setName("Third Job");
            jobDetail3.setJobClass(ScheduleSendEmailQueue.class);

            //Creating schedule time with trigger
            SimpleTriggerImpl simpleTrigger3= new SimpleTriggerImpl();
            simpleTrigger3.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger3.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
            time = constant.readProperty("schedule.check_email");
            if (!time.equals("error")) {
                minute = Integer.parseInt(time);
            } else {
                minute = 1;
            }
            Long duration3 = Duration.standardMinutes(minute).getMillis();
            simpleTrigger3.setRepeatInterval(duration3);
            simpleTrigger3.setName("ThirdTrigger");

            //Creating Job and link to our Job class
            JobDetailImpl jobDetail4 = new JobDetailImpl();
            jobDetail4.setName("Forth Job");
            jobDetail4.setJobClass(ScheduleSendWelcomeEmail.class);

            //Creating schedule time with trigger
            SimpleTriggerImpl simpleTrigger4 = new SimpleTriggerImpl();
            simpleTrigger4.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger4.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
            time = constant.readProperty("schedule.send_welcome_mail");
            if (!time.equals("error")) {
                minute = Integer.parseInt(time);
            } else {
                minute = 1;
            }
            Long duration4 = Duration.standardMinutes(minute).getMillis();
            simpleTrigger4.setRepeatInterval(duration4);
            simpleTrigger4.setName("ForthTrigger");

            //Creating Job and link to our Job class
            JobDetailImpl jobDetail5 = new JobDetailImpl();
            jobDetail5.setName("Fifth Job");
            jobDetail5.setJobClass(ScheduleCheckAppointment.class);

            //Creating schedule time with trigger
            SimpleTriggerImpl simpleTrigger5 = new SimpleTriggerImpl();
            simpleTrigger5.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger5.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
            time = constant.readProperty("schedule.check_appointment");
            if (!time.equals("error")) {
                minute = Integer.parseInt(time);
            } else {
                minute = 1;
            }
            Long duration5 = Duration.standardMinutes(minute).getMillis();
            simpleTrigger5.setRepeatInterval(duration5);
            simpleTrigger5.setName("FifthTrigger");

            //Creating Job and link to our Job class
            JobDetailImpl jobDetail6 = new JobDetailImpl();
            jobDetail6.setName("Sixth Job");
            jobDetail6.setJobClass(ScheduleCheckRequestRental.class);

            //Creating schedule time with trigger
            SimpleTriggerImpl simpleTrigger6 = new SimpleTriggerImpl();
            simpleTrigger6.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger6.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
            time = constant.readProperty("schedule.check_appointment");
            if (!time.equals("error")) {
                minute = Integer.parseInt(time);
            } else {
                minute = 1;
            }
            Long duration6 = Duration.standardMinutes(minute).getMillis();
            simpleTrigger6.setRepeatInterval(duration6);
            simpleTrigger6.setName("SixthTrigger");

            //Creating Job and link to our Job class
            JobDetailImpl jobDetail7 = new JobDetailImpl();
            jobDetail7.setName("Seventh Job");
            jobDetail7.setJobClass(ScheduleCheckRequestRepair.class);

            //Creating schedule time with trigger
            SimpleTriggerImpl simpleTrigger7 = new SimpleTriggerImpl();
            simpleTrigger7.setStartTime(new Date(System.currentTimeMillis() + 1000));
            simpleTrigger7.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
            time = constant.readProperty("schedule.check_appointment");
            if (!time.equals("error")) {
                minute = Integer.parseInt(time);
            } else {
                minute = 1;
            }
            Long duration7 = Duration.standardMinutes(minute).getMillis();
            simpleTrigger7.setRepeatInterval(duration7);
            simpleTrigger7.setName("SeventhTrigger");
            //Start scheduler

            scheduler.start();
            scheduler.scheduleJob(jobDetail1, simpleTrigger1);
            scheduler.scheduleJob(jobDetail2, simpleTrigger2);
            scheduler.scheduleJob(jobDetail3, simpleTrigger3);
            scheduler.scheduleJob(jobDetail4, simpleTrigger4);
            scheduler.scheduleJob(jobDetail5, simpleTrigger5);
            scheduler.scheduleJob(jobDetail6, simpleTrigger6);
            scheduler.scheduleJob(jobDetail7, simpleTrigger7);
            /*DateTime now = new DateTime();
            DateTime startSchedule;
            if (now.hourOfDay().get() > 17) {
                startSchedule = now.withDayOfYear(now.getDayOfYear()+1).withHourOfDay(8).withMinuteOfHour(0);
            } else {
                startSchedule = now.withHourOfDay(now.getHourOfDay() + 1).withMinuteOfHour(0);
            }*/
        } catch (SchedulerException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("On shutdown web app");
        try {
            scheduler = factory.getScheduler();
            scheduler.shutdown();
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }

    public static Scheduler getScheduler() {
        return scheduler;
    }
}
