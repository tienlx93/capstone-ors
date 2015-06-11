package dao;

import entity.RentalItem;
import org.hibernate.Transaction;

/**
 * Created by Thành on 10/06/2015.
 */
public class RentalItemDAO extends BaseDAO<RentalItem, Integer> {

    public RentalItemDAO() {
        super(RentalItem.class);
    }

    public void update(int id, String name, String description, double price, Integer quantity) {
        Transaction trans = session.beginTransaction();
        try {
            RentalItem rtItem = (RentalItem)session.get(RentalItem.class,id);
            rtItem.setName(name);
            rtItem.setDescription(description);
            rtItem.setPrice(price);
            rtItem.setQuantity(quantity);
            session.update(rtItem);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }
}
