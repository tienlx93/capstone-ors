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
    private Collection<OfficeAmenity> officeAmenitiesById;
    private Collection<RequestAmenity> requestAmenitiesById;
    private Collection<RepairDetail> repairDetailsById;
    private Integer weight;
    private Integer amenityGroupId;
    private AmenityGroup amenityGroupByAmenityGroupId;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Amenity amenity = (Amenity) o;

        if (id != amenity.id) return false;
        if (name != null ? !name.equals(amenity.name) : amenity.name != null) return false;
        if (description != null ? !description.equals(amenity.description) : amenity.description != null) return false;
        if (weight != null ? !weight.equals(amenity.weight) : amenity.weight != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (weight != null ? weight.hashCode() : 0);
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

    @OneToMany(mappedBy = "amenityByAmenityId")
    public Collection<RepairDetail> getRepairDetailsById() {
        return repairDetailsById;
    }

    public void setRepairDetailsById(Collection<RepairDetail> repairDetailsById) {
        this.repairDetailsById = repairDetailsById;
    }

    @Basic
    @Column(name = "Weight", nullable = true, insertable = true, updatable = true)
    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    @Basic
    @Column(name = "AmenityGroupId", nullable = true, insertable = true, updatable = true)
    public Integer getAmenityGroupId() {
        return amenityGroupId;
    }

    public void setAmenityGroupId(Integer amenityGroupId) {
        this.amenityGroupId = amenityGroupId;
    }

    @ManyToOne
    @JoinColumn(name = "AmenityGroupId", referencedColumnName = "Id", insertable = false, updatable = false)
    public AmenityGroup getAmenityGroupByAmenityGroupId() {
        return amenityGroupByAmenityGroupId;
    }

    public void setAmenityGroupByAmenityGroupId(AmenityGroup amenityGroupByAmenityGroupId) {
        this.amenityGroupByAmenityGroupId = amenityGroupByAmenityGroupId;
    }
}
