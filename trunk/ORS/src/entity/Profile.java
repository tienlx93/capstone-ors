package entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class Profile {
    private String username;
    private String title;
    private String fullName;
    private String company;
    private String phone;
    private String address;
    private Timestamp birthday;
    private Account accountByUsername;

    @Id
    @Column(name = "Username", nullable = false, insertable = true, updatable = true)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "Title", nullable = false, insertable = true, updatable = true, length = 4)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "FullName", nullable = false, insertable = true, updatable = true)
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Basic
    @Column(name = "Company", nullable = true, insertable = true, updatable = true)
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Basic
    @Column(name = "Phone", nullable = false, insertable = true, updatable = true, length = 15)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "Address", nullable = true, insertable = true, updatable = true)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "Birthday", nullable = true, insertable = true, updatable = true)
    public Timestamp getBirthday() {
        return birthday;
    }

    public void setBirthday(Timestamp birthday) {
        this.birthday = birthday;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Profile profile = (Profile) o;

        if (username != null ? !username.equals(profile.username) : profile.username != null) return false;
        if (title != null ? !title.equals(profile.title) : profile.title != null) return false;
        if (fullName != null ? !fullName.equals(profile.fullName) : profile.fullName != null) return false;
        if (company != null ? !company.equals(profile.company) : profile.company != null) return false;
        if (phone != null ? !phone.equals(profile.phone) : profile.phone != null) return false;
        if (address != null ? !address.equals(profile.address) : profile.address != null) return false;
        if (birthday != null ? !birthday.equals(profile.birthday) : profile.birthday != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (fullName != null ? fullName.hashCode() : 0);
        result = 31 * result + (company != null ? company.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (birthday != null ? birthday.hashCode() : 0);
        return result;
    }

    @OneToOne
    @JoinColumn(name = "Username", referencedColumnName = "Username", nullable = false)
    public Account getAccountByUsername() {
        return accountByUsername;
    }

    public void setAccountByUsername(Account accountByUsername) {
        this.accountByUsername = accountByUsername;
    }
}
