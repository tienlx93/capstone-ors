package service;

import java.util.Map;

/**
 * Created by ASUS on 7/4/2015.
 */
public class Test {
    public static void main(final String[] args) {
        ScheduleService2 scheduleService = new ScheduleService2();
        String staff = "staff1";
        Map<Integer, String> map = scheduleService.makeAppointmentSchedule();
        //scheduleService.makeRepairSchedule();
    }
}
