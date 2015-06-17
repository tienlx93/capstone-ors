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
    public List<Contract> getContractListByCus(String username) {
        try {
            String sql = "from Contract where customerUsername = ?";
            Query query = session.createQuery(sql);
            query.setString(0, username);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
