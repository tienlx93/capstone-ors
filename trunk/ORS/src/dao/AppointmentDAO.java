package dao;

import entity.Appointment;
import org.hibernate.Transaction;

import java.sql.Timestamp;

/**
 * Created by xps on 6/11/2015.
 */
public class AppointmentDAO extends BaseDAO<Appointment, Integer> {
    public AppointmentDAO() {
        super(Appointment.class);
    }

    public void update(int id, String assignedStaff, Timestamp time, int statusId) {

        Transaction trans = session.beginTransaction();
        try {
            Appointment appointment = (Appointment)session.get(Appointment.class,id);
            appointment.setAssignedStaff(assignedStaff);
            appointment.setTime(time);
            appointment.setStatusId(statusId);
            session.update(appointment);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }

}
