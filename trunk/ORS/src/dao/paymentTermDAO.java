package dao;

import entity.PaymentTerm;
/**
 * Created by xps on 6/9/2015.
 */
public class PaymentTermDAO extends BaseDAO<PaymentTerm, Integer>{
    public PaymentTermDAO() {
        super(PaymentTerm.class);
    }
}
