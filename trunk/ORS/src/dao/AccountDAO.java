package dao;

import entity.Account;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by ASUS on 5/28/2015.
 */
public class AccountDAO extends BaseDAO<Account, String> {

    //Constructor
    public AccountDAO() {
        super(Account.class);
    }

    public List<Account> getAccountList() {
        try {
            String sql = "from Account  where statusId != 3 ";
            Query query = session.createQuery(sql);
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Account> getNotAccountList() {
        try {
            String sql = "from Account  where statusId = 3";
            Query query = session.createQuery(sql);
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Account loginByEmail(String email, String password) { //TESTED OK
        try {
            session.getTransaction().begin();
            String sql = "from Account where email = ? and password = ?";
            Query query = session.createQuery(sql);
            query.setString(0, email);
            query.setString(1, password);
            entity.Account account = (Account) query.uniqueResult();

            if (account != null) {
                return account;
            }
        } catch (Exception e) {
            if (session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public void update(String username, Account newAccount) {
        Transaction trans = session.beginTransaction();
        try {
            Account account = (Account) session.get(Account.class, username);
            account.setPassword(newAccount.getPassword());
            account.setEmail(newAccount.getEmail());
            account.setStatusId(newAccount.getStatusId());
            account.setRoleId(newAccount.getRoleId());

            session.update(account);
            trans.commit();

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }

    }

    public boolean updatePass(String username, String pass) {
        Transaction trans = session.beginTransaction();
        try {
            Account account = (Account) session.get(Account.class, username);
            account.setPassword(pass);
            session.update(account);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

    public boolean delete(String username) {
        Transaction trans = session.beginTransaction();
        try {
            Account account = (Account) session.get(Account.class, username);
            account.setStatusId(3);
            session.update(account);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }


    public Account login(String username, String password) {
        try {
            session.getTransaction().begin();
            String sql = "from Account where username = ? and password = ?";
            Query query = session.createQuery(sql);
            query.setString(0, username);
            query.setString(1, password);
            entity.Account account = (Account) query.uniqueResult();

            if (account != null) {
                return account;
            }
        } catch (Exception e) {
            if (session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public List<Account> findStaff() {
        try {
            String sql = "from Account  where roleId = 3 and statusId = 1";
            Query query = session.createQuery(sql);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public List<Account> getAccountByPage(int firstResult, int pageSize) {

        try {

            Criteria criteria = session.createCriteria(Account.class);
            criteria.add(Restrictions.ne("statusId", 3));
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

            Criteria criteriaCount = session.createCriteria(Account.class);
            criteriaCount.setProjection(Projections.rowCount());
            Long count = (Long) criteriaCount.uniqueResult();
            return (int) Math.ceil((double)count / pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public Account findByUsername(String username) {
        try {
            String sql = "from Account where username = ?";
            Query query = session.createQuery(sql);
            query.setString(0, username);
            entity.Account account = (Account) query.uniqueResult();
            if (account != null) {
                return account;
            }
        } catch (Exception e) {
            if (session.getTransaction().isActive()) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
            return null;
        }

        return null;
    }
}