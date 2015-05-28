package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 5/28/2015.
 */
@Entity
public class Amenity {
    private int id;
    private String name;
    private String description;
    private Collection<OfficeAmenity> officeAmenitiesById;
    private Collection<RequestAmenity> requestAmenitiesById;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Amenity amenity = (Amenity) o;

        if (id != amenity.id) return false;
        if (name != null ? !name.equals(amenity.name) : amenity.name != null) return false;
        if (description != null ? !description.equals(amenity.description) : amenity.description != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
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
