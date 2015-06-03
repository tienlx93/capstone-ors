package dao;

import entity.RepairStatus;

/**
 * Created by Thành on 02/06/2015.
 */
public class RepairStatusDAO extends BaseDAO<RepairStatus, Integer> {

    public RepairStatusDAO() {
        super(RepairStatus.class);
    }
}
