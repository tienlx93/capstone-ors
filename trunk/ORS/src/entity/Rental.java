package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 6/8/2015.
 */
@Entity
public class Rental {
    private int id;
    private int contractId;
    private String assignStaff;
    private int statusId;
    private String description;
    private Account accountByAssignStaff;
    private Contract contractByContractId;
    private RepairStatus repairStatusByStatusId;
    private Collection<RentalDetail> rentalDetailsById;
    private RentalStatus rentalStatusByStatusId;

    @Id
    @Column(name = "Id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "ContractId", nullable = false, insertable = true, updatable = true)
    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    @Basic
    @Column(name = "AssignStaff", nullable = true, insertable = true, updatable = true)
    public String getAssignStaff() {
        return assignStaff;
    }

    public void setAssignStaff(String assignStaff) {
        this.assignStaff = assignStaff;
    }

    @Basic
    @Column(name = "StatusId", nullable = false, insertable = true, updatable = true)
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Basic
    @Column(name = "Description", nullable = true, insertable = true, updatable = true)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Rental rental = (Rental) o;

        if (id != rental.id) return false;
        if (contractId != rental.contractId) return false;
        if (statusId != rental.statusId) return false;
        if (assignStaff != null ? !assignStaff.equals(rental.assignStaff) : rental.assignStaff != null) return false;
        if (description != null ? !description.equals(rental.description) : rental.description != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + contractId;
        result = 31 * result + (assignStaff != null ? assignStaff.hashCode() : 0);
        result = 31 * result + statusId;
        result = 31 * result + (description != null ? description.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "AssignStaff", referencedColumnName = "Username", insertable = false, updatable = false)
    public Account getAccountByAssignStaff() {
        return accountByAssignStaff;
    }

    public void setAccountByAssignStaff(Account accountByAssignStaff) {
        this.accountByAssignStaff = accountByAssignStaff;
    }

    @ManyToOne
    @JoinColumn(name = "ContractId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Contract getContractByContractId() {
        return contractByContractId;
    }

    public void setContractByContractId(Contract contractByContractId) {
        this.contractByContractId = contractByContractId;
    }

    @ManyToOne
    @JoinColumn(name = "StatusId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public RepairStatus getRepairStatusByStatusId() {
        return repairStatusByStatusId;
    }

    public void setRepairStatusByStatusId(RepairStatus repairStatusByStatusId) {
        this.repairStatusByStatusId = repairStatusByStatusId;
    }

    @OneToMany(mappedBy = "rentalByRentalId")
    public Collection<RentalDetail> getRentalDetailsById() {
        return rentalDetailsById;
    }

    public void setRentalDetailsById(Collection<RentalDetail> rentalDetailsById) {
        this.rentalDetailsById = rentalDetailsById;
    }

    @ManyToOne
    @JoinColumn(name = "StatusId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public RentalStatus getRentalStatusByStatusId() {
        return rentalStatusByStatusId;
    }

    public void setRentalStatusByStatusId(RentalStatus rentalStatusByStatusId) {
        this.rentalStatusByStatusId = rentalStatusByStatusId;
    }
}
