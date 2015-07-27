package dao;


import entity.Repair;
import org.hibernate.Criteria;
import org.hibernate.Transaction;

import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by Th�nh on 01/06/2015.
 */
public class RepairDAO extends BaseDAO<Repair, Integer> {

    public RepairDAO() {
        super(Repair.class);
    }

    public void update(Integer id, int contractId, String assignedStaff, String description, Date assignedTime, int repairStatusId) {

        Transaction trans = session.beginTransaction();
        try {
            Repair rp = (Repair) session.get(Repair.class, id);
            rp.setContractId(contractId);
            rp.setAssignedStaff(assignedStaff);
            rp.setDescription(description);
            rp.setAssignedTime(new Timestamp(assignedTime.getTime()));
            rp.setRepairStatusId(repairStatusId);
            rp.setUpdateTime(new Timestamp(new Date().getTime()));
            session.update(rp);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }

    }

    public List<Repair> getRepairListByStaff(String username) {
        try {
            String sql = "from Repair where assignedStaff = ?";
            Query query = session.createQuery(sql);
            query.setString(0, username);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean changeStatus(int id, int status) {
        Transaction trans = session.beginTransaction();
        try {
            Repair appointment = (Repair) session.get(Repair.class, id);
            appointment.setRepairStatusId(status);
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

    public List<Repair> getRepairListByContract(int contractId) {
        try {
            String sql = "from Repair where contractId = ?";
            Query query = session.createQuery(sql);
            query.setInteger(0, contractId);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Repair> getRepairListByStaffInRange(String username, Date startDate, Date endDate) {
        try {
            String sql = "from Repair where assignedStaff = :username and assignedTime >= :startDate and assignedTime < :endDate";
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

    public List<Repair> getRepairByPage(int firstResult, int pageSize) {

        try {

            Criteria criteria = session.createCriteria(Repair.class);
            //criteria.add(Restrictions.ne("statusId", 3));
            criteria.setFirstResult(firstResult);
            criteria.setMaxResults(pageSize);
            return criteria.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Repair> getRepairListByFilter(int officeId) {
        try {
            String sql = "from Repair ";
            if (officeId >= 0) {
                sql += "where contractByContractId.officeId = :officeId";
            }
            Query query = session.createQuery(sql);
            query.setInteger("officeId", officeId);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Repair> getRepairListByFilter(String officeName, String staff) {
        try {
            String sql = "from Repair ";
            if (!officeName.equals("")) {
                sql += "where contractByContractId.officeByOfficeId.name like :officeName";
                if (!staff.equals("")) {
                    sql += " and assignedStaff like :staff";
                }
            } else if (!staff.equals("")) {
                sql += "where assignedStaff like :staff";
            }
            Query query = session.createQuery(sql);
            if (!officeName.equals("")) {
                query.setString("officeName", "%" + officeName + "%");
            }
            if (!staff.equals("")) {
                query.setString("staff", staff);
            }

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int getPageCount(int pageSize) {
        try {

            Criteria criteriaCount = session.createCriteria(Repair.class);
            criteriaCount.setProjection(Projections.rowCount());
            Long count = (Long) criteriaCount.uniqueResult();
            return (int) Math.ceil((double) count / pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public List<Repair> getRepairListByStatus(int status) {
        try {
            String sql = "from Repair where repairStatusId = :status";
            Query query = session.createQuery(sql);
            query.setInteger("status", status);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
