package dao;

import entity.OfficeGroup;
import org.hibernate.Query;
import org.hibernate.Transaction;

import java.util.List;
import java.util.Map;

/**
 * Created by ASUS on 7/12/2015.
 */
public class OfficeGroupDAO extends BaseDAO<OfficeGroup, Integer> {
    public OfficeGroupDAO() {
        super(OfficeGroup.class);
    }

    public int deleteAll() {
        try {
            String sql = "DELETE FROM OfficeGroup";
            Query query = session.createQuery(sql);
            return query.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean insertAll(Integer[][] group) {
        Transaction trans = session.getTransaction();
        try {
            trans.begin();
            OfficeGroup officeGroup;
            for (Integer[] office : group) {
                officeGroup = new OfficeGroup();
                officeGroup.setOfficeId(office[0]);
                officeGroup.setOfficeGroup(office[1]);
                session.save(officeGroup);
            }
            trans.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<OfficeGroup> getOfficeList(int group) {
        try {
            String sql = "from OfficeGroup where officeGroup = :officeGroup";
            Query query = session.createQuery(sql);
            query.setInteger("officeGroup", group);
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
