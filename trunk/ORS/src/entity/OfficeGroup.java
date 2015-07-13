package entity;

import javax.persistence.*;

/**
 * Created by ASUS on 7/12/2015.
 */
@Entity
public class OfficeGroup {
    private int officeId;
    private int officeGroup;
    private Office officeByOfficeId;

    @Id
    @Column(name = "OfficeId", nullable = false, insertable = true, updatable = true)
    public int getOfficeId() {
        return officeId;
    }

    public void setOfficeId(int officeId) {
        this.officeId = officeId;
    }

    @Basic
    @Column(name = "OfficeGroup", nullable = false, insertable = true, updatable = true)
    public int getOfficeGroup() {
        return officeGroup;
    }

    public void setOfficeGroup(int officeGroup) {
        this.officeGroup = officeGroup;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OfficeGroup that = (OfficeGroup) o;

        if (officeId != that.officeId) return false;
        if (officeGroup != that.officeGroup) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = officeId;
        result = 31 * result + officeGroup;
        return result;
    }

    @OneToOne
    @JoinColumn(name = "OfficeId", referencedColumnName = "Id", nullable = false)
    public Office getOfficeByOfficeId() {
        return officeByOfficeId;
    }

    public void setOfficeByOfficeId(Office officeByOfficeId) {
        this.officeByOfficeId = officeByOfficeId;
    }
}
