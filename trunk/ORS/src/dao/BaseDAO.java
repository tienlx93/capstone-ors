package dao;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Created by ASUS on 5/28/2015.
 */
public class BaseDAO<E, I extends Serializable> {

    protected Session session;
    private final Class<E> type;

    public BaseDAO(Class<E> type) {
        this.type = type;
        session = util.HibernateUtil.getSession();
    }

    public List<E> findAll() {
        Transaction trans = null;
        try {
            trans = session.beginTransaction();

            return session.createCriteria(type).list();
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return null;

    }

    public E get(I id) {
        Transaction trans = null;
        try {
            trans = session.beginTransaction();

            E source = (E) session.get(type, id);

            return source;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return null;
    }

    public boolean save(E item) {
        Transaction trans = null;
        try {
            trans = session.beginTransaction();

            session.save(item);
            session.getTransaction().commit();

            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

    public boolean remove(E item) {
        Transaction trans = null;
        try {
            trans = session.beginTransaction();
            trans.begin();
            session.delete(item);
            session.flush();
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            e.printStackTrace();

        }
        return false;
    }

    public void test() {

    }
}