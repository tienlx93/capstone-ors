package dao;

import entity.AmenityGroup;
import org.hibernate.Query;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Tuan on 6/29/2015.
 */
public class AmenityGroupDAO extends BaseDAO<AmenityGroup, Integer> {
    public AmenityGroupDAO() {
        super(AmenityGroup.class);}
        public List<AmenityGroup> getAmenityGroup() {
            try {
                String sql = "from Amenity order by id";
                Query query = session.createQuery(sql);
                return query.list();

            } catch (Exception e) {
                e.printStackTrace();
            }

            return null;
        }
    public boolean update(String name, AmenityGroup amenityGroup) {
        Transaction trans = session.beginTransaction();
        try {
            AmenityGroup amenitygroup = (AmenityGroup) session.get(AmenityGroup.class, name);
            amenitygroup.setDescription(amenityGroup.getDescription());
            session.update(amenitygroup);
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


