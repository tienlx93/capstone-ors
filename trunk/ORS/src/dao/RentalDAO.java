package dao;

import entity.Rental;
import org.hibernate.Transaction;

/**
 * Created by Thành on 08/06/2015.
 */
public class RentalDAO extends BaseDAO<Rental, Integer> {

    public RentalDAO() {
        super(Rental.class);
    }

    public void update(int id, int contractId, String assignStaff, int statusId, String description) {

        Transaction trans = session.beginTransaction();
        try {
            Rental rt = (Rental)session.get(Rental.class,id);
            rt.setContractId(contractId);
            rt.setAssignStaff(assignStaff);
            rt.setStatusId(statusId);
            rt.setDescription(description);
            session.update(rt);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }
}
