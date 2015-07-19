package entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ASUS on 7/14/2015.
 */
@Entity
public class EmailQueue {
    private int id;
    private String officeIds;
    private Timestamp createTime;
    private Account accountByUsername;
    private String username;

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
    @Column(name = "OfficeIds", nullable = true, insertable = true, updatable = true)
    public String getOfficeIds() {
        return officeIds;
    }

    public void setOfficeIds(String officeIds) {
        this.officeIds = officeIds;
    }

    @Basic
    @Column(name = "CreateTime", nullable = true, insertable = true, updatable = true)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmailQueue that = (EmailQueue) o;

        if (id != that.id) return false;
        if (officeIds != null ? !officeIds.equals(that.officeIds) : that.officeIds != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (officeIds != null ? officeIds.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "Username", referencedColumnName = "Username", nullable = false, insertable = false, updatable = false)
    public Account getAccountByUsername() {
        return accountByUsername;
    }

    public void setAccountByUsername(Account accountByUsername) {
        this.accountByUsername = accountByUsername;
    }

    @Basic
    @Column(name = "Username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
