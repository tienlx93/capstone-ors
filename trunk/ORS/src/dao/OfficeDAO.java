package dao;

import entity.Office;

/**
 * Created by ASUS on 6/2/2015.
 */
public class OfficeDAO extends BaseDAO<Office, Integer> {
    public OfficeDAO() {
        super(Office.class);
    }

}
