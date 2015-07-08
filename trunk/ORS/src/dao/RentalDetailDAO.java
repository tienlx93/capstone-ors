package dao;

import entity.RentalDetail;
import org.hibernate.Query;

import java.util.List;

/**
 * Created by Thành on 09/06/2015.
 */
public class RentalDetailDAO extends BaseDAO<RentalDetail, Integer> {

    public RentalDetailDAO() {
        super(RentalDetail.class);
    }

    public boolean saveRentalDetail(int rentalId, List<Integer> rentalList) {
        RentalDetail rentalDetail;
        try {
            session.getTransaction().begin();
            for (Integer i : rentalList) {
                rentalDetail = new RentalDetail();

                session.save(rentalDetail);
            }
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return false;
    }

    public List<RentalDetail> getRentalDetailByRental(int rentalId) {
        try {
            String sql = "from RentalDetail where rentalId = ?";
            Query query = session.createQuery(sql);
            query.setInteger(0, rentalId);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
