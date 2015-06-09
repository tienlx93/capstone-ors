package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 6/1/2015.
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
    private Profile profileByUsername;
    private Collection<Repair> repairsByUsername;
    private Collection<RequestOffice> requestOfficesByUsername;
    private int statusId;
    private AccountStatus accountStatusByStatusId;
    private Collection<Rental> rentalsByUsername;

    @Id
    @Column(name = "Username", nullable = false, insertable = true, updatable = true)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "Password", nullable = false, insertable = true, updatable = true, length = 50)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "Email", nullable = false, insertable = true, updatable = true, length = 50)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "RoleId", nullable = false, insertable = true, updatable = true)
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
    public AccountStatus getAccountStatusByStatusId() {
        return accountStatusByStatusId;
    }

    public void setAccountStatusByStatusId(AccountStatus accountStatusByStatusId) {
        this.accountStatusByStatusId = accountStatusByStatusId;
    }

    @OneToMany(mappedBy = "accountByAssignStaff")
    public Collection<Rental> getRentalsByUsername() {
        return rentalsByUsername;
    }

    public void setRentalsByUsername(Collection<Rental> rentalsByUsername) {
        this.rentalsByUsername = rentalsByUsername;
    }
}
