package dao;

import entity.OfficeAmenity;
import org.hibernate.Query;

import java.util.List;

/**
 * Created by ASUS on 6/9/2015.
 */
public class OfficeAmenityDAO extends BaseDAO<OfficeAmenity, Integer> {
    public OfficeAmenityDAO() {
        super(OfficeAmenity.class);
    }

    public boolean saveOfficeAmenity(int officeId, List<Integer> amenityList) {
        OfficeAmenity officeAmenity;
        try {
            session.getTransaction().begin();
            for (Integer i : amenityList) {
                officeAmenity = new OfficeAmenity();
                officeAmenity.setOfficeId(officeId);
                officeAmenity.setAmenityId(i);
                session.save(officeAmenity);
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

    public boolean removeByOffice(int id) {
        try {
            session.getTransaction().begin();
            String sql = "delete from OfficeAmenity where officeId = :officeId";
            Query query = session.createQuery(sql);
            query.setInteger("officeId", id);
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

    public List<OfficeAmenity> getAmenityIdByOfficeId(int id) {

        try {
            String sql = "from OfficeAmenity where officeId = ?";
            Query query = session.createQuery(sql);
            query.setInteger(0, id);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
