package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class Amenity {
    private int id;
    private String name;
    private String description;
    private Integer hitCount;
    private Collection<OfficeAmenity> officeAmenitiesById;
    private Collection<RequestAmenity> requestAmenitiesById;

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
    @Column(name = "Name", nullable = false, insertable = true, updatable = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Description", nullable = true, insertable = true, updatable = true)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "HitCount", nullable = true, insertable = true, updatable = true)
    public Integer getHitCount() {
        return hitCount;
    }

    public void setHitCount(Integer hitCount) {
        this.hitCount = hitCount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Amenity amenity = (Amenity) o;

        if (id != amenity.id) return false;
        if (name != null ? !name.equals(amenity.name) : amenity.name != null) return false;
        if (description != null ? !description.equals(amenity.description) : amenity.description != null) return false;
        if (hitCount != null ? !hitCount.equals(amenity.hitCount) : amenity.hitCount != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (hitCount != null ? hitCount.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "amenityByAmenityId")
    public Collection<OfficeAmenity> getOfficeAmenitiesById() {
        return officeAmenitiesById;
    }

    public void setOfficeAmenitiesById(Collection<OfficeAmenity> officeAmenitiesById) {
        this.officeAmenitiesById = officeAmenitiesById;
    }

    @OneToMany(mappedBy = "amenityByAmenityId")
    public Collection<RequestAmenity> getRequestAmenitiesById() {
        return requestAmenitiesById;
    }

    public void setRequestAmenitiesById(Collection<RequestAmenity> requestAmenitiesById) {
        this.requestAmenitiesById = requestAmenitiesById;
    }
}
