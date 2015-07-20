package dao;

import entity.Appointment;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;

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

    public boolean updateStatus(int id, int statusId) {

        Transaction trans = session.beginTransaction();
        try {
            Appointment appointment = (Appointment)session.get(Appointment.class,id);
            appointment.setStatusId(statusId);
            appointment.setUpdateTime(new Timestamp(new Date().getTime()));
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

    public boolean updateComment(int id, int statusId, String comment) {

        Transaction trans = session.beginTransaction();
        try {
            Appointment appointment = (Appointment)session.get(Appointment.class,id);
            appointment.setStatusId(statusId);
            appointment.setComment(comment);
            appointment.setUpdateTime(new Timestamp(new Date().getTime()));
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

    public List<Appointment> getAppointmentListSendSMS() {
        try {
            String sql = "from Appointment where statusId in (3, 5)";
            Query query = session.createQuery(sql);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int countAppointment(int status, String username) {
        try {
            String sql = "SELECT COUNT(Id) AS Quantity FROM Appointment WHERE StatusId = :status";
            if (username!=null) {
                sql += " AND AssignedStaff = :username";
            }
            SQLQuery query = session.createSQLQuery(sql).addScalar("Quantity", StandardBasicTypes.INTEGER);
            query.setInteger("status", status);
            if (username!=null) {
                query.setString("username", username);
            }
            return (int) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countRental(int status, String username) {
        try {
            String sql = "SELECT COUNT(Id) AS Quantity FROM Rental WHERE StatusId = :status";
            if (username!=null) {
                sql += " AND AssignStaff = :username";
            }
            SQLQuery query = session.createSQLQuery(sql).addScalar("Quantity", StandardBasicTypes.INTEGER);
            query.setInteger("status", status);
            if (username!=null) {
                query.setString("username", username);
            }
            return (int) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countRepair(int status, String username) {
        try {
            String sql = "SELECT COUNT(Id) AS Quantity FROM Repair WHERE RepairStatusId = :status";
            if (username!=null) {
                sql += " AND AssignedStaff = :username";
            }
            SQLQuery query = session.createSQLQuery(sql).addScalar("Quantity", StandardBasicTypes.INTEGER);
            query.setInteger("status", status);
            if (username!=null) {
                query.setString("username", username);
            }
            return (int) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
