package dao;

import entity.Account;
import entity.Amenity;
import org.hibernate.Query;

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
}
