package dao;

import entity.Appointment;
import entity.Repair;
import org.hibernate.Transaction;

import org.hibernate.Query;

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

    public void update(Integer id, int contractId, String assignedStaff, String description, int repairStatusId) {

        Transaction trans = session.beginTransaction();
        try {
            Repair rp = (Repair) session.get(Repair.class, id);
            rp.setContractId(contractId);
            rp.setAssignedStaff(assignedStaff);
            rp.setDescription(description);
            rp.setRepairStatusId(repairStatusId);
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
}
