package entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ASUS on 5/28/2015.
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
    @Column(name = "AssignedStaff")
    public String getAssignedStaff() {
        return assignedStaff;
    }

    public void setAssignedStaff(String assignedStaff) {
        this.assignedStaff = assignedStaff;
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
    @Column(name = "Time")
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
}
