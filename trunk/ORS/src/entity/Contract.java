package entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by ASUS on 6/1/2015.
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
    private int statusId;
    private Account accountByCustomerUsername;
    private ContractStatus contractStatusByStatusId;
    private PaymentTerm paymentTermByPaymentTerm;
    private Collection<Repair> repairsById;
    private Office officeByOfficeId;
    private Collection<Rental> rentalsById;
    private String comment;
    private Long deposit;
    private Date cancelDate;
    private String imageUrl;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "Id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "CustomerUsername", nullable = false, insertable = true, updatable = true)
    public String getCustomerUsername() {
        return customerUsername;
    }

    public void setCustomerUsername(String customerUsername) {
        this.customerUsername = customerUsername;
    }

    @Basic
    @Column(name = "OfficeId", nullable = false, insertable = true, updatable = true)
    public int getOfficeId() {
        return officeId;
    }

    public void setOfficeId(int officeId) {
        this.officeId = officeId;
    }

    @Basic
    @Column(name = "StartDate", nullable = false, insertable = true, updatable = true)
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Basic
    @Column(name = "EndDate", nullable = false, insertable = true, updatable = true)
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Basic
    @Column(name = "PaymentFee", nullable = false, insertable = true, updatable = true)
    public int getPaymentFee() {
        return paymentFee;
    }

    public void setPaymentFee(int paymentFee) {
        this.paymentFee = paymentFee;
    }

    @Basic
    @Column(name = "PaymentTerm", nullable = false, insertable = true, updatable = true)
    public int getPaymentTerm() {
        return paymentTerm;
    }

    public void setPaymentTerm(int paymentTerm) {
        this.paymentTerm = paymentTerm;
    }

    @Basic
    @Column(name = "StatusId", nullable = false, insertable = true, updatable = true)
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
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
        if (statusId != contract.statusId) return false;
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
        result = 31 * result + statusId;
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
    @JoinColumn(name = "StatusId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public ContractStatus getContractStatusByStatusId() {
        return contractStatusByStatusId;
    }

    public void setContractStatusByStatusId(ContractStatus contractStatusByStatusId) {
        this.contractStatusByStatusId = contractStatusByStatusId;
    }

    @ManyToOne
    @JoinColumn(name = "PaymentTerm", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
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

    @ManyToOne
    @JoinColumn(name = "OfficeId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Office getOfficeByOfficeId() {
        return officeByOfficeId;
    }

    public void setOfficeByOfficeId(Office officeByOfficeId) {
        this.officeByOfficeId = officeByOfficeId;
    }

    @OneToMany(mappedBy = "contractByContractId")
    public Collection<Rental> getRentalsById() {
        return rentalsById;
    }

    public void setRentalsById(Collection<Rental> rentalsById) {
        this.rentalsById = rentalsById;
    }

    @Basic
    @Column(name = "Comment", nullable = true, insertable = true, updatable = true)
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Basic
    @Column(name = "Deposit", nullable = true, insertable = true, updatable = true)
    public Long getDeposit() {
        return deposit;
    }

    public void setDeposit(Long deposit) {
        this.deposit = deposit;
    }

    @Basic
    @Column(name = "CancelDate", nullable = true, insertable = true, updatable = true)
    public Date getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }

    @Basic
    @Column(name = "ImageUrl", nullable = true, insertable = true, updatable = true)
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
