package dao;

import entity.RequestOffice;
import org.hibernate.Transaction;

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
}
