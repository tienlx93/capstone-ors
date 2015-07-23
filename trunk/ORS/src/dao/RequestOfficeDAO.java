package dao;

import entity.RequestOffice;
import org.hibernate.Query;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by Thành on 08/07/2015.
 */
public class RequestOfficeDAO extends BaseDAO<RequestOffice, Integer> {

    public RequestOfficeDAO() {
        super(RequestOffice.class);
    }

    public boolean updateOfficeSuggest(int id, String officeSuggest) {
        Transaction trans = session.beginTransaction();
        try {
            RequestOffice requestOffice = (RequestOffice) session.get(RequestOffice.class, id);
            requestOffice.setOfficeSuggested(officeSuggest);
            session.update(requestOffice);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

    public List<RequestOffice> getAllRequestOfficeByUsername(String username) {
        try {
            String sql = "from RequestOffice where customerUsername LIKE ?";
            Query query = session.createQuery(sql);
            query.setString(0, '%' + username + '%');
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
