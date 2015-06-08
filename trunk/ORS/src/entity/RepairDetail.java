package entity;

import javax.persistence.*;

/**
 * Created by ASUS on 6/8/2015.
 */
@Entity
public class RepairDetail {
    private int id;
    private int repairId;
    private int amenityId;
    private Amenity amenityByAmenityId;
    private Repair repairByRepairId;

    @Id
    @Column(name = "Id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "RepairId", nullable = false, insertable = true, updatable = true)
    public int getRepairId() {
        return repairId;
    }

    public void setRepairId(int repairId) {
        this.repairId = repairId;
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

        RepairDetail that = (RepairDetail) o;

        if (id != that.id) return false;
        if (repairId != that.repairId) return false;
        if (amenityId != that.amenityId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + repairId;
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

    @ManyToOne
    @JoinColumn(name = "RepairId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Repair getRepairByRepairId() {
        return repairByRepairId;
    }

    public void setRepairByRepairId(Repair repairByRepairId) {
        this.repairByRepairId = repairByRepairId;
    }
}
