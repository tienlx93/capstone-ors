package dao;

import entity.Contract;
import entity.Repair;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.sql.Date;
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

    public  List<Contract> getContractListAvailable() {
        try {
            String sql = "from Contract where statusId = 1";
            Query query = session.createQuery(sql);

            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Contract> getContractByPage(int firstResult, int pageSize) {

        try {

            Criteria criteria = session.createCriteria(Contract.class);
            //criteria.add(Restrictions.ne("statusId", 3));
            criteria.setFirstResult(firstResult);
            criteria.setMaxResults(pageSize);
            return criteria.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int getPageCount(int pageSize) {
        try {

            Criteria criteriaCount = session.createCriteria(Contract.class);
            criteriaCount.setProjection(Projections.rowCount());
            Long count = (Long) criteriaCount.uniqueResult();
            return (int) Math.ceil((double)count / pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    public boolean changeStatus(int id, int status) {
        Transaction trans = session.beginTransaction();
        try {
            Contract contract = (Contract) session.get(Contract.class, id);
            contract.setStatusId(status);
            session.update(contract);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

    public void update(Integer id, String customerUsername, int officeId, Date startDate, Date endDate,
                       int paymentFee, int paymentTerm, int statusId) {

        Transaction trans = session.beginTransaction();
        try {
            Contract ct = (Contract) session.get(Contract.class, id);
            ct.setCustomerUsername(customerUsername);
            ct.setOfficeId(officeId);
            ct.setStartDate(startDate);
            ct.setEndDate(endDate);
            ct.setPaymentFee(paymentFee);
            ct.setPaymentTerm(paymentTerm);
            ct.setStatusId(statusId);
            session.update(ct);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }

    }

    public Object getCusNameByIdContract(int id) {
        try {
            String sql = "from Contract where id = ?";
            Query query = session.createQuery(sql);
            query.setInteger(0, id);

            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
