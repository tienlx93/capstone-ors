package dao;

import entity.AppointmentStatus;

/**
 * Created by xps on 6/11/2015.
 */
public class AppointmentStatusDAO extends BaseDAO<AppointmentStatus, Integer> {
    public AppointmentStatusDAO() {
        super(AppointmentStatus.class);
    }
}
