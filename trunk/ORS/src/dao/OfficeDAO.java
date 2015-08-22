package dao;

import entity.Contract;
import entity.Office;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.StandardBasicTypes;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * Created by ASUS on 6/2/2015.
 */
public class OfficeDAO extends BaseDAO<Office, Integer> {
    public OfficeDAO() {
        super(Office.class);
    }

    public List<Office> getOfficeByAddress(String searchKey) {
        try {
            String sql = "from Office where address LIKE ?";
            Query query = session.createQuery(sql);
            query.setString(0, '%' + searchKey + '%');
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Office viewOffice(int id) {
        Transaction trans = session.getTransaction();
        try {
            trans.begin();
            Office office = (Office) session.get(Office.class, id);
            office.setViewCount(office.getViewCount() == null ? 1 : office.getViewCount() + 1);
            session.update(office);
            trans.commit();
            return office;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return null;
    }

    public boolean updateArea(int id, double area) {
        Transaction trans = session.beginTransaction();
        try {
            Office office = (Office) session.get(Office.class, id);
            office.setArea(area);
            session.update(office);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }
    public boolean update(int id, Office newOffice) {
        Transaction trans = session.beginTransaction();
        try {
            Office office = (Office) session.get(Office.class, id);
            office.setName(newOffice.getName());
            office.setAddress(newOffice.getAddress());
            office.setDescription(newOffice.getDescription());
            office.setPrice(newOffice.getPrice());
            office.setPriceTerm(newOffice.getPriceTerm());
            office.setFloorNumber(newOffice.getFloorNumber());
            office.setArea(newOffice.getArea());
            office.setImageUrls(newOffice.getImageUrls());
            office.setCategoryId(newOffice.getCategoryId());
            office.setCity(newOffice.getCity());
            office.setDistrict(newOffice.getDistrict());
            office.setLongitude(newOffice.getLongitude());
            office.setLatitude(newOffice.getLatitude());


            session.update(office);
            trans.commit();
            return true;
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
        }
        return false;
    }

    public List<Office> getNewOffice() {
        try {
            String sql = "from Office where statusId = 1 order by viewCount desc";
            Query query = session.createQuery(sql);
            return query.setMaxResults(5).list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Office> getAllOffice() {

        try {
            String sql = "from Office where statusId = 1  and parentOfficeId = NULL";
            Query query = session.createQuery(sql);
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Object getChildOffice(int id) {

        try {
            String sql = "from Office where parentOfficeId = ?";
            Query query = session.createQuery(sql);
            query.setInteger(0, id);

            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Office> getAllOfficeAvailable() {

        try {
            String sql = "from Office where statusId = 1";
            Query query = session.createQuery(sql);
            return query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Office> getOfficeByPage(int firstResult, int pageSize) {

        try {

            Criteria criteria = session.createCriteria(Office.class);
            criteria.add(Restrictions.ne("statusId", 3));
            criteria.add(Restrictions.isNull("parentOfficeId"));
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

            Criteria criteriaCount = session.createCriteria(Office.class);
            criteriaCount.add(Restrictions.ne("statusId", 3));
            criteriaCount.add(Restrictions.isNull("parentOfficeId"));
            criteriaCount.setProjection(Projections.rowCount());
            Long count = (Long) criteriaCount.uniqueResult();
            return (int) Math.ceil((double)count / pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public int countDistrict() {
        try {
            String sql = "SELECT COUNT(DISTINCT District) AS DistrictNumber FROM Office";
            SQLQuery query = session.createSQLQuery(sql).addScalar("DistrictNumber", StandardBasicTypes.INTEGER);
            return (int) query.uniqueResult();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 2;
    }

    public List<String> allDistrict() {
        List<String> result = null;
        try {
            String sql = "SELECT DISTINCT (district) FROM Office";
            Query query = session.createQuery(sql);
            result = query.list();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Long calculateIncome(Date startDate, Date endDate, String district) {
        Long result = 0L;
        try {
            String sql = "EXEC CalculateIncome :startDate, :endDate, :district";
            SQLQuery query = session.createSQLQuery(sql)
                    .addScalar("Income", StandardBasicTypes.LONG);
            query.setDate("startDate", startDate);
            query.setDate("endDate", endDate);
            query.setString("district", district);
            Object o = query.uniqueResult();
            float percent;
            if (o != null) {
                percent = (Long) o * 5 /100;
            }

            String sql2 = "from Contract where startDate < :endDate and endDate >= :startDate";
            if (!district.equals("")) {
                sql2 += " and officeByOfficeId.district = :district";
            }
            Query query2 = session.createQuery(sql2);
            if (!district.equals("")) {
                query2.setString("district", district);
            }
            query2.setDate("startDate", startDate);
            query2.setDate("endDate", endDate);
            List<Contract> list = query2.list();
            float sum = 0;
            Office office;
            for (Contract contract : list) {
                office = contract.getOfficeByOfficeId();
                if (Objects.equals(office.getBasePrice(), office.getPrice())) {
                    sum += contract.getPaymentFee() * office.getArea() * office.getCommission() / 100;
                } else {
                    sum += (contract.getPaymentFee() - office.getBasePrice()) * office.getArea();
                }
            }
            result += Math.round(sum);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
