package entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class Repair {
    private int id;
    private int contractId;
    private String assignedStaff;
    private String description;
    private int repairStatusId;
    private Account accountByAssignedStaff;
    private Contract contractByContractId;
    private RepairStatus repairStatusByRepairStatusId;
    private Collection<RepairDetail> repairDetailsById;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Timestamp assignedTime;

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
    @Column(name = "ContractId", nullable = false, insertable = true, updatable = true)
    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    @Basic
    @Column(name = "AssignedStaff", nullable = true, insertable = true, updatable = true)
    public String getAssignedStaff() {
        return assignedStaff;
    }

    public void setAssignedStaff(String assignedStaff) {
        this.assignedStaff = assignedStaff;
    }

    @Basic
    @Column(name = "Description", nullable = false, insertable = true, updatable = true)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "RepairStatusId", nullable = false, insertable = true, updatable = true)
    public int getRepairStatusId() {
        return repairStatusId;
    }

    public void setRepairStatusId(int repairStatusId) {
        this.repairStatusId = repairStatusId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Repair repair = (Repair) o;

        if (id != repair.id) return false;
        if (contractId != repair.contractId) return false;
        if (repairStatusId != repair.repairStatusId) return false;
        if (assignedStaff != null ? !assignedStaff.equals(repair.assignedStaff) : repair.assignedStaff != null)
            return false;
        if (description != null ? !description.equals(repair.description) : repair.description != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + contractId;
        result = 31 * result + (assignedStaff != null ? assignedStaff.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + repairStatusId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "AssignedStaff", referencedColumnName = "Username", insertable = false, updatable = false)
    public Account getAccountByAssignedStaff() {
        return accountByAssignedStaff;
    }

    public void setAccountByAssignedStaff(Account accountByAssignedStaff) {
        this.accountByAssignedStaff = accountByAssignedStaff;
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
    @JoinColumn(name = "RepairStatusId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public RepairStatus getRepairStatusByRepairStatusId() {
        return repairStatusByRepairStatusId;
    }

    public void setRepairStatusByRepairStatusId(RepairStatus repairStatusByRepairStatusId) {
        this.repairStatusByRepairStatusId = repairStatusByRepairStatusId;
    }

    @OneToMany(mappedBy = "repairByRepairId")
    public Collection<RepairDetail> getRepairDetailsById() {
        return repairDetailsById;
    }

    public void setRepairDetailsById(Collection<RepairDetail> repairDetailsById) {
        this.repairDetailsById = repairDetailsById;
    }

    @Basic
    @Column(name = "CreateTime", nullable = false, insertable = true, updatable = true)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "UpdateTime", nullable = true, insertable = true, updatable = true)
    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    @Basic
    @Column(name = "AssignedTime", nullable = true, insertable = true, updatable = true)
    public Timestamp getAssignedTime() {
        return assignedTime;
    }

    public void setAssignedTime(Timestamp assignedTime) {
        this.assignedTime = assignedTime;
    }
}
