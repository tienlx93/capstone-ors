package dao;

import entity.Account;
import entity.Amenity;
import entity.AmenityGroup;
import entity.OfficeAmenity;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by ASUS on 6/2/2015.
 */
public class AmenityDAO extends BaseDAO<Amenity, Integer> {
    public AmenityDAO() {
        super(Amenity.class);
    }

    public Amenity searchAmenity(String amenity) {
        try {
            String sql = "from Amenity where name = ?";
            Query query = session.createQuery(sql);
            query.setString(0, amenity);
            entity.Amenity result = (Amenity) query.uniqueResult();

            return  result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addAmenities(List<String> amenityList){
        Amenity amenity;
        try {
            session.getTransaction().begin();
            for (String s : amenityList) {
                if (searchAmenity(s)==null){
                    amenity = new Amenity();
                    amenity.setName(s);
                    amenity.setWeight(0);
                    session.save(amenity);
                }
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
    public List<Amenity> getAmenityList() {
        try {
            String sql = "from Amenity  order by id";
            Query query = session.createQuery(sql);
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<OfficeAmenity> getAmenityByOfficeId(int id) {
        try {
            String sql = "from OfficeAmenity where officeId = :officeId";
            Query query = session.createQuery(sql);
            query.setInteger("officeId", id);

            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Amenity> getAmenityByPage(int firstResult, int pageSize) {

        try {

            Criteria criteria = session.createCriteria(Amenity.class);
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

            Criteria criteriaCount = session.createCriteria(Amenity.class);
            criteriaCount.setProjection(Projections.rowCount());
            Long count = (Long) criteriaCount.uniqueResult();
            return (int) Math.ceil((double)count / pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public void update(int id, String name, String description, Integer weight, Integer amenityGroupId, Integer priority, String repairable) {
        Transaction trans = session.beginTransaction();
        try {
            Amenity amenity = (Amenity) session.get(Amenity.class, id);
            amenity.setName(name);
            amenity.setDescription(description);
            amenity.setWeight(weight);
            amenity.setPriority(priority);
            amenity.setAmenityGroupId(amenityGroupId);
            if (repairable == null) {
                amenity.setRepairable(false);
            } else if (repairable.equals("True")) {
                amenity.setRepairable(true);
            }
            session.update(amenity);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }
    public boolean removeAmenity(int id) {
        try {
            session.getTransaction().begin();
            String sql = "delete from RequestAmenity where amenityId = :amenityId";
            Query query = session.createQuery(sql);
            query.setInteger("amenityId", id);
            query.executeUpdate();

            String sql1 = "delete from RepairDetail where amenityId = :amenityId";
            Query query1 = session.createQuery(sql1);
            query1.setInteger("amenityId", id);
            query1.executeUpdate();

            String sql2 = "delete from OfficeAmenity where amenityId = :amenityId";
            Query query2 = session.createQuery(sql2);
            query2.setInteger("amenityId", id);
            query2.executeUpdate();

            String sql3 = "delete from Amenity where id = :amenityId";
            Query query3 = session.createQuery(sql3);
            query3.setInteger("amenityId", id);
            query3.executeUpdate();

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
