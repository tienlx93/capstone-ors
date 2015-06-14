package dao;

import entity.Appointment;
import entity.Rental;
import org.hibernate.Query;
import org.hibernate.Transaction;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

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
            Rental rt = (Rental) session.get(Rental.class, id);
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

    public List<Rental> getRentalListByStaff(String username) {
        try {
            String sql = "from Rental where assignStaff = ?";
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
            Rental rental = (Rental) session.get(Rental.class, id);
            rental.setStatusId(status);
            rental.setUpdateTime(new Timestamp((new Date()).getTime()));
            session.update(rental);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

}
