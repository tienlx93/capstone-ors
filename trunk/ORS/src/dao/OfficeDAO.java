package dao;

import entity.Office;
import org.hibernate.Query;
import org.hibernate.Transaction;

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
}
