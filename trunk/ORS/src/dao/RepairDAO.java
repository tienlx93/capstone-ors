package dao;

import entity.Repair;
import org.hibernate.Transaction;

/**
 * Created by Th�nh on 01/06/2015.
 */
public class RepairDAO extends BaseDAO<Repair, Integer> {

    public RepairDAO() {
        super(Repair.class);
    }

    public void update(Integer id, int contractId, String assignedStaff, String type, String description, int repairStatusId) {

        Transaction trans = session.beginTransaction();
        try {
            Repair rp = (Repair)session.get(Repair.class,id);
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

}
