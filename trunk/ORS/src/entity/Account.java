package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 5/28/2015.
 */
@Entity
public class Account {
    private String username;
    private String password;
    private String email;
    private int roleId;
    private Role roleByRoleId;
    private Collection<Appointment> appointmentsByUsername;
    private Collection<Appointment> appointmentsByUsername_0;
    private Collection<Contract> contractsByUsername;
    private Collection<Office> officesByUsername;
    private Profile profileByUsername;
    private Collection<Repair> repairsByUsername;
    private Collection<RequestOffice> requestOfficesByUsername;

    @Id
    @Column(name = "Username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "Password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "Email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "RoleId")
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Account account = (Account) o;

        if (roleId != account.roleId) return false;
        if (username != null ? !username.equals(account.username) : account.username != null) return false;
        if (password != null ? !password.equals(account.password) : account.password != null) return false;
        if (email != null ? !email.equals(account.email) : account.email != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + roleId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "RoleId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Role getRoleByRoleId() {
        return roleByRoleId;
    }

    public void setRoleByRoleId(Role roleByRoleId) {
        this.roleByRoleId = roleByRoleId;
    }

    @OneToMany(mappedBy = "accountByCustomerUsername")
    public Collection<Appointment> getAppointmentsByUsername() {
        return appointmentsByUsername;
    }

    public void setAppointmentsByUsername(Collection<Appointment> appointmentsByUsername) {
        this.appointmentsByUsername = appointmentsByUsername;
    }

    @OneToMany(mappedBy = "accountByAssignedStaff")
    public Collection<Appointment> getAppointmentsByUsername_0() {
        return appointmentsByUsername_0;
    }

    public void setAppointmentsByUsername_0(Collection<Appointment> appointmentsByUsername_0) {
        this.appointmentsByUsername_0 = appointmentsByUsername_0;
    }

    @OneToMany(mappedBy = "accountByCustomerUsername")
    public Collection<Contract> getContractsByUsername() {
        return contractsByUsername;
    }

    public void setContractsByUsername(Collection<Contract> contractsByUsername) {
        this.contractsByUsername = contractsByUsername;
    }

    @OneToMany(mappedBy = "accountByManagerAccount")
    public Collection<Office> getOfficesByUsername() {
        return officesByUsername;
    }

    public void setOfficesByUsername(Collection<Office> officesByUsername) {
        this.officesByUsername = officesByUsername;
    }

    @OneToOne(mappedBy = "accountByUsername")
    public Profile getProfileByUsername() {
        return profileByUsername;
    }

    public void setProfileByUsername(Profile profileByUsername) {
        this.profileByUsername = profileByUsername;
    }

    @OneToMany(mappedBy = "accountByAssignedStaff")
    public Collection<Repair> getRepairsByUsername() {
        return repairsByUsername;
    }

    public void setRepairsByUsername(Collection<Repair> repairsByUsername) {
        this.repairsByUsername = repairsByUsername;
    }

    @OneToMany(mappedBy = "accountByCustomerUsername")
    public Collection<RequestOffice> getRequestOfficesByUsername() {
        return requestOfficesByUsername;
    }

    public void setRequestOfficesByUsername(Collection<RequestOffice> requestOfficesByUsername) {
        this.requestOfficesByUsername = requestOfficesByUsername;
    }
}
