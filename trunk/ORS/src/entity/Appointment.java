package entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class Appointment {
    private int id;
    private String customerUsername;
    private String assignedStaff;
    private int officeId;
    private Timestamp time;
    private Account accountByCustomerUsername;
    private Account accountByAssignedStaff;
    private Office officeByOfficeId;
    private int statusId;
    private AppointmentStatus appointmentStatusByStatusId;
    private Timestamp createTime;
    private Timestamp updateTime;
    private String comment;

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
    @Column(name = "AssignedStaff", nullable = true, insertable = true, updatable = true)
    public String getAssignedStaff() {
        return assignedStaff;
    }

    public void setAssignedStaff(String assignedStaff) {
        this.assignedStaff = assignedStaff;
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
    @Column(name = "Time", nullable = false, insertable = true, updatable = true)
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Appointment that = (Appointment) o;

        if (id != that.id) return false;
        if (officeId != that.officeId) return false;
        if (customerUsername != null ? !customerUsername.equals(that.customerUsername) : that.customerUsername != null)
            return false;
        if (assignedStaff != null ? !assignedStaff.equals(that.assignedStaff) : that.assignedStaff != null)
            return false;
        if (time != null ? !time.equals(that.time) : that.time != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (customerUsername != null ? customerUsername.hashCode() : 0);
        result = 31 * result + (assignedStaff != null ? assignedStaff.hashCode() : 0);
        result = 31 * result + officeId;
        result = 31 * result + (time != null ? time.hashCode() : 0);
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
    @JoinColumn(name = "AssignedStaff", referencedColumnName = "Username", insertable = false, updatable = false)
    public Account getAccountByAssignedStaff() {
        return accountByAssignedStaff;
    }

    public void setAccountByAssignedStaff(Account accountByAssignedStaff) {
        this.accountByAssignedStaff = accountByAssignedStaff;
    }

    @ManyToOne
    @JoinColumn(name = "OfficeId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Office getOfficeByOfficeId() {
        return officeByOfficeId;
    }

    public void setOfficeByOfficeId(Office officeByOfficeId) {
        this.officeByOfficeId = officeByOfficeId;
    }

    @Basic
    @Column(name = "StatusId", nullable = false, insertable = true, updatable = true)
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @ManyToOne
    @JoinColumn(name = "StatusId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public AppointmentStatus getAppointmentStatusByStatusId() {
        return appointmentStatusByStatusId;
    }

    public void setAppointmentStatusByStatusId(AppointmentStatus appointmentStatusByStatusId) {
        this.appointmentStatusByStatusId = appointmentStatusByStatusId;
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
    @Column(name = "Comment", nullable = true, insertable = true, updatable = true)
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
