package entity;

import javax.persistence.*;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class OfficeAmenity {
    private int id;
    private int officeId;
    private int amenityId;
    private Amenity amenityByAmenityId;

    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "Id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "AmenityId", nullable = false, insertable = true, updatable = true)
    public int getAmenityId() {
        return amenityId;
    }

    public void setAmenityId(int amenityId) {
        this.amenityId = amenityId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OfficeAmenity that = (OfficeAmenity) o;

        if (id != that.id) return false;
        if (officeId != that.officeId) return false;
        if (amenityId != that.amenityId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + officeId;
        result = 31 * result + amenityId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "AmenityId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Amenity getAmenityByAmenityId() {
        return amenityByAmenityId;
    }

    public void setAmenityByAmenityId(Amenity amenityByAmenityId) {
        this.amenityByAmenityId = amenityByAmenityId;
    }
}
