package dao;

import entity.Amenity;

/**
 * Created by ASUS on 6/2/2015.
 */
public class AmenityDAO extends BaseDAO<Amenity, Integer> {
    public AmenityDAO() {
        super(Amenity.class);
    }
}
