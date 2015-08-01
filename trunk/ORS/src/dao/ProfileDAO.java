package dao;

import entity.Profile;
import org.hibernate.Query;
import org.hibernate.Transaction;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by Thành on 02/07/2015.
 */
public class ProfileDAO extends BaseDAO<Profile, Integer> {

    public ProfileDAO() {
        super(Profile.class);
    }

    public Object getProfileByUser(String username) {
        try {
            String sql = "from Profile where username = ?";
            Query query = session.createQuery(sql);
            query.setString(0, username);

            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean update(String username, String fullName, String company, String phone, String address, Timestamp birthday) {

        Transaction trans = session.beginTransaction();
        try {
            Profile pr = (Profile) session.get(Profile.class, username);
            pr.setFullName(fullName);
            pr.setCompany(company);
            pr.setPhone(phone);
            pr.setAddress(address);
            pr.setBirthday(birthday);

            session.update(pr);
            trans.commit();
            return true;

        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            return false;
        }

    }

}
