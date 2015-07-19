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
}
