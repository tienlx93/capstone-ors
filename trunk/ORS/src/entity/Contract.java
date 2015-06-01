package entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by ASUS on 5/28/2015.
 */
@Entity
public class Contract {
    private int id;
    private String customerUsername;
    private int officeId;
    private Date startDate;
    private Date endDate;
    private int paymentFee;
    private int paymentTerm;
    private Account accountByCustomerUsername;
    private Office officeByOfficeId;
    private PaymentTerm paymentTermByPaymentTerm;
    private Collection<Repair> repairsById;
    private int statusId;
    private ContractStatus contractStatusByStatusId;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "CustomerUsername")
    public String getCustomerUsername() {
        return customerUsername;
    }

    public void setCustomerUsername(String customerUsername) {
        this.customerUsername = customerUsername;
    }

    @Basic
    @Column(name = "OfficeId")
    public int getOfficeId() {
        return officeId;
    }

    public void setOfficeId(int officeId) {
        this.officeId = officeId;
    }

    @Basic
    @Column(name = "StartDate")
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Basic
    @Column(name = "EndDate")
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Basic
    @Column(name = "PaymentFee")
    public int getPaymentFee() {
        return paymentFee;
    }

    public void setPaymentFee(int paymentFee) {
        this.paymentFee = paymentFee;
    }

    @Basic
    @Column(name = "PaymentTerm")
    public int getPaymentTerm() {
        return paymentTerm;
    }

    public void setPaymentTerm(int paymentTerm) {
        this.paymentTerm = paymentTerm;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Contract contract = (Contract) o;

        if (id != contract.id) return false;
        if (officeId != contract.officeId) return false;
        if (paymentFee != contract.paymentFee) return false;
        if (paymentTerm != contract.paymentTerm) return false;
        if (customerUsername != null ? !customerUsername.equals(contract.customerUsername) : contract.customerUsername != null)
            return false;
        if (startDate != null ? !startDate.equals(contract.startDate) : contract.startDate != null) return false;
        if (endDate != null ? !endDate.equals(contract.endDate) : contract.endDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (customerUsername != null ? customerUsername.hashCode() : 0);
        result = 31 * result + officeId;
        result = 31 * result + (startDate != null ? startDate.hashCode() : 0);
        result = 31 * result + (endDate != null ? endDate.hashCode() : 0);
        result = 31 * result + paymentFee;
        result = 31 * result + paymentTerm;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "CustomerUsername", referencedColumnName = "Username", nullable = false, insertable = false, updatable = false)
    public Account getAccountByCustomerUsername() {
        return accountByCustomerUsername;
    }

    public void setAccountByCustomerUsername(Account accountByCustomerUsername) {
        this.accountByCustomerUsername = accountByCustomerUsername;
    }

    @ManyToOne
    @JoinColumn(name = "OfficeId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Office getOfficeByOfficeId() {
        return officeByOfficeId;
    }

    public void setOfficeByOfficeId(Office officeByOfficeId) {
        this.officeByOfficeId = officeByOfficeId;
    }

    @ManyToOne
    @JoinColumns({@JoinColumn(name = "PaymentTerm", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false), @JoinColumn(name = "PaymentTerm", referencedColumnName = "Id", nullable = false)})
    public PaymentTerm getPaymentTermByPaymentTerm() {
        return paymentTermByPaymentTerm;
    }

    public void setPaymentTermByPaymentTerm(PaymentTerm paymentTermByPaymentTerm) {
        this.paymentTermByPaymentTerm = paymentTermByPaymentTerm;
    }

    @OneToMany(mappedBy = "contractByContractId")
    public Collection<Repair> getRepairsById() {
        return repairsById;
    }

    public void setRepairsById(Collection<Repair> repairsById) {
        this.repairsById = repairsById;
    }

    @Basic
    @Column(name = "StatusId")
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @ManyToOne
    @JoinColumn(name = "StatusId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public ContractStatus getContractStatusByStatusId() {
        return contractStatusByStatusId;
    }

    public void setContractStatusByStatusId(ContractStatus contractStatusByStatusId) {
        this.contractStatusByStatusId = contractStatusByStatusId;
    }
}
