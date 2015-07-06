package dao;

import entity.RentalDetail;

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
}
