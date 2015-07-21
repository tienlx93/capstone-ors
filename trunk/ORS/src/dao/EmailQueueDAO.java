package dao;

import entity.EmailQueue;
import org.hibernate.Query;

/**
 * Created by xps on 7/15/2015.
 */
public class EmailQueueDAO extends BaseDAO<EmailQueue, Integer> {
    public EmailQueueDAO() {
        super(EmailQueue.class);
    }
     public int getFirstEmailQueue() {
        try {
            String sql = "select id from EmailQueue";
            Query query = session.createQuery(sql);

            return query.uniqueResult() != null ? (int) query.uniqueResult() : -1 ;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }

}
