package dao;

import entity.RentalItem;

/**
 * Created by Thành on 10/06/2015.
 */
public class RentalItemDAO extends BaseDAO<RentalItem, Integer> {

    public RentalItemDAO() {
        super(RentalItem.class);
    }

    public void update(int id, String name, String description, String price, String quantity) {
    }
}
