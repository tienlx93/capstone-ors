package dao;

import entity.RepairDetail;

import java.util.List;

/**
 * Created by ASUS on 6/17/2015.
 */
public class RepairDetailDAO extends BaseDAO<RepairDetail, Integer>{
    public RepairDetailDAO() {
        super(RepairDetail.class);
    }

    public boolean saveRepairDetail(int repairId, List<Integer> amenityList) {
        RepairDetail repairDetail;
        try {
            session.getTransaction().begin();
            for (Integer i : amenityList) {
                repairDetail = new RepairDetail();
                repairDetail.setRepairId(repairId);
                repairDetail.setAmenityId(i);
                session.save(repairDetail);
            }
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
}
