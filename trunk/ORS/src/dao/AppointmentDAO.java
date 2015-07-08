package dao;

import entity.Appointment;
import org.hibernate.Query;
import org.hibernate.Transaction;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by xps on 6/11/2015.
 */
public class AppointmentDAO extends BaseDAO<Appointment, Integer> {
    public AppointmentDAO() {
        super(Appointment.class);
    }

    public boolean changeStatus(int id, int statusId) {
        Transaction trans = session.beginTransaction();
        try {
            Appointment appointment = (Appointment) session.get(Appointment.class, id);
            appointment.setStatusId(statusId);
            appointment.setUpdateTime(new Timestamp((new Date()).getTime()));
            session.update(appointment);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

    public void update(int id, String assignedStaff, Date time, int statusId) {

        Transaction trans = session.beginTransaction();
        try {
            Appointment appointment = (Appointment) session.get(Appointment.class, id);
            appointment.setAssignedStaff(assignedStaff);
            appointment.setStatusId(statusId);
            appointment.setTime(new Timestamp(time.getTime()));
            appointment.setUpdateTime(new Timestamp(new Date().getTime()));
            session.update(appointment);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }

    public void updateStatus(int id, int statusId) {

        Transaction trans = session.beginTransaction();
        try {
            Appointment appointment = (Appointment)session.get(Appointment.class,id);
            appointment.setStatusId(statusId);
            appointment.setUpdateTime(new Timestamp(new Date().getTime()));
            session.update(appointment);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }

    public void updateComment(int id, int statusId, String comment) {

        Transaction trans = session.beginTransaction();
        try {
            Appointment appointment = (Appointment)session.get(Appointment.class,id);
            appointment.setStatusId(statusId);
            appointment.setComment(comment);
            appointment.setUpdateTime(new Timestamp(new Date().getTime()));
            session.update(appointment);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }

    public List<Appointment> getAppointmentListByStaff(String username) {
        try {
            String sql = "from Appointment where assignedStaff = ?";
            Query query = session.createQuery(sql);
            query.setString(0, username);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Appointment> getAppointmentListByStaffInRange(String username, Date startDate, Date endDate) {
        try {
            String sql = "from Appointment where assignedStaff = :username and time >= :startDate and time < :endDate";
            Query query = session.createQuery(sql);
            query.setString("username", username);
            query.setDate("startDate", startDate);
            query.setDate("endDate", endDate);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Appointment> getAppointmentListByStatus(int status) {
        try {
            String sql = "from Appointment where statusId = :status";
            Query query = session.createQuery(sql);
            query.setInteger("status", status);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
