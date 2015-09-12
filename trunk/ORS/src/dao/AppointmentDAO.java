package dao;

import entity.Appointment;
import entity.Office;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
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
    public List<Appointment> getAppointmentByPage(int firstResult, int pageSize) {

        try {

            Criteria criteria = session.createCriteria(Appointment.class);
            //criteria.add(Restrictions.ne("statusId", 3));
            criteria.setFirstResult(firstResult);
            criteria.setMaxResults(pageSize);
            return criteria.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int getPageCount(int pageSize) {
        try {

            Criteria criteriaCount = session.createCriteria(Appointment.class);
            criteriaCount.setProjection(Projections.rowCount());
            Long count = (Long) criteriaCount.uniqueResult();
            return (int) Math.ceil((double)count / pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
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

    public List<Appointment> getAppointmentListByStaffAndOffice(String username, String officeName) {
        try {
            String sql;
            if (officeName.equals("")) {
                sql = "from Appointment";
                if (!username.equals("")) {
                    sql += " where assignedStaff like :username";
                }
            } else {
                sql = "from Appointment where officeByOfficeId.name like :office";
                if (!username.equals("")) {
                    sql += " and assignedStaff like :username";
                }
            }
            Query query = session.createQuery(sql);
            if (!username.equals("")) {
                query.setString("username", "%" + username + "%");
            }
            if (!officeName.equals("")) {
                query.setString("office", "%" + officeName + "%");
            }

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

    public long countOwnerRepair(String owner) {
        try {
            String sql = "SELECT COUNT(id) AS Quantity FROM Repair WHERE repairStatusId = :status " +
                    "AND contractByContractId.officeByOfficeId.ownerUsername = :owner";

            Query query = session.createQuery(sql);
            query.setInteger("status", 1);
            query.setString("owner", owner);

            return (long) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
