package dao;

import entity.RentalItem;
import org.hibernate.Criteria;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by Thành on 10/06/2015.
 */
public class RentalItemDAO extends BaseDAO<RentalItem, Integer> {

    public RentalItemDAO() {
        super(RentalItem.class);
    }

    public void update(int id, String name, String description, double price, int officeType, Integer quantity, String imageUrl) {
        Transaction trans = session.beginTransaction();
        try {
            RentalItem rtItem = (RentalItem)session.get(RentalItem.class,id);
            rtItem.setName(name);
            rtItem.setDescription(description);
            rtItem.setPrice(price);
            rtItem.setOfficeType(officeType);
            rtItem.setQuantity(quantity);
            rtItem.setImageUrl(imageUrl);
            session.update(rtItem);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }

    public void updateQuantity(int id, Integer quantity) {
        Transaction trans = session.beginTransaction();
        try {
            RentalItem rtItem = (RentalItem)session.get(RentalItem.class,id);
            rtItem.setQuantity(quantity);
            session.update(rtItem);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }

    public List<RentalItem> getRentalItemByPage(int firstResult, int pageSize) {

        try {

            Criteria criteria = session.createCriteria(RentalItem.class);
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

            Criteria criteriaCount = session.createCriteria(RentalItem.class);
            criteriaCount.setProjection(Projections.rowCount());
            Long count = (Long) criteriaCount.uniqueResult();
            return (int) Math.ceil((double)count / pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
