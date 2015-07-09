package dao;

import entity.RequestAmenity;

import java.util.List;

/**
 * Created by Thành on 09/07/2015.
 */
public class RequestAmenityDAO extends BaseDAO<RequestAmenity, Integer> {
    public RequestAmenityDAO() {
        super(RequestAmenity.class);
    }

    public boolean saveRequestAmenity(int requestOfficeId, List<Integer> amenityList) {
        RequestAmenity requestAmenity;
        try {
            session.getTransaction().begin();
            for (Integer i : amenityList) {
                requestAmenity = new RequestAmenity();
                requestAmenity.setRequestOfficeId(requestOfficeId);
                requestAmenity.setAmenityId(i);
                session.save(requestAmenity);
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
