package dao;

import entity.Contract;
import org.hibernate.Query;

import java.util.List;

/**
 * Created by xps on 6/2/2015.
 */
public class ContractDAO extends BaseDAO<Contract, Integer> {
    public ContractDAO() {
        super(Contract.class);
    }

    public List<Contract> findAllContractWithOfficeId(int officeID) {
        try {
            session.getTransaction().begin();
            String sql = "from Contract where officeId = ?";
            Query query = session.createQuery(sql);
            query.setInteger(0, officeID);
            return query.list();
        } catch(Exception e) {
            return null;

        }
        //return null;
    }

}
