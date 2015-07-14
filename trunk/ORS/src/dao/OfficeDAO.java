package dao;

import entity.Contract;
import entity.Office;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;

import java.util.List;

/**
 * Created by ASUS on 6/2/2015.
 */
public class OfficeDAO extends BaseDAO<Office, Integer> {
    public OfficeDAO() {
        super(Office.class);
    }

    public List<Office> getOfficeByAddress(String searchKey) {
        try {
            String sql = "from Office where address LIKE ?";
            Query query = session.createQuery(sql);
            query.setString(0, '%' + searchKey + '%');
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Office viewOffice(int id) {
        Transaction trans = session.getTransaction();
        try {
            trans.begin();
            Office office = (Office) session.get(Office.class, id);
            office.setViewCount(office.getViewCount() == null ? 1 : office.getViewCount() + 1);
            session.update(office);
            trans.commit();
            return office;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return null;
    }

    public boolean updateArea(int id, double area) {
        Transaction trans = session.beginTransaction();
        try {
            Office office = (Office) session.get(Office.class, id);
            office.setArea(area);
            session.update(office);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }
    public boolean update(String name, Office newoffice) {
        Transaction trans = session.beginTransaction();
        try {
            Office office = (Office) session.get(Office.class, name);
            office.setAddress(newoffice.getAddress());
            office.setDescription(newoffice.getDescription());
            office.setPrice(newoffice.getPrice());
            office.setPriceTerm(newoffice.getPriceTerm());
            office.setFloorNumber(newoffice.getFloorNumber());
            office.setArea(newoffice.getArea());
            office.setImageUrls(newoffice.getImageUrls());
            office.setCategoryId(newoffice.getCategoryId());
            office.setCity(newoffice.getCity());
            office.setDistrict(newoffice.getDistrict());
            office.setLongitude(newoffice.getLongitude());
            office.setLatitude(newoffice.getLatitude());


            session.update(office);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

    public List<Office> getNewOffice() {
        try {
            String sql = "from Office order by viewCount desc";
            Query query = session.createQuery(sql);
            return query.setMaxResults(5).list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Office> getAllOffice() {

        try {
            String sql = "from Office where statusId != 3";
            Query query = session.createQuery(sql);
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int countDistrict() {
        try {
            String sql = "SELECT COUNT(DISTINCT District) AS DistrictNumber FROM Office";
            SQLQuery query = session.createSQLQuery(sql).addScalar("DistrictNumber", StandardBasicTypes.INTEGER);
            return (int) query.uniqueResult();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 2;
    }
}
