package dao;

import entity.Account;
import entity.Amenity;
import entity.AmenityGroup;
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
    public boolean update(String name, Amenity newAmenity) {
        Transaction trans = session.beginTransaction();
        try {
            Amenity amenity = (Amenity) session.get(Amenity.class, name);
            amenity.setId(newAmenity.getId());
            amenity.setWeight(newAmenity.getWeight());
            amenity.setDescription(newAmenity.getDescription());
            amenity.setPriority(newAmenity.getPriority());
            amenity.setAmenityGroupId(newAmenity.getAmenityGroupId());

            session.update(amenity);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

    public void updateN(int id, String name, String description, Integer weight, Integer amenityGroupId, Integer priority) {
        Transaction trans = session.beginTransaction();
        try {
            Amenity amenity = (Amenity) session.get(Amenity.class, id);
            amenity.setName(name);
            amenity.setDescription(description);
            amenity.setWeight(weight);
            amenity.setPriority(priority);
            amenity.setAmenityGroupId(amenityGroupId);

            session.update(amenity);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }

    }
}
