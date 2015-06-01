package dao;

import entity.Account;
import org.hibernate.Query;

/**
 * Created by ASUS on 5/28/2015.
 */
public class AccountDAO  extends BaseDAO<Account, String> {

    //Constructor
    public AccountDAO() {
        super(Account.class);
    }

    public Account login(String email, String password) { //TESTED OK
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
}