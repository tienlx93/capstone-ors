package entity;

import javax.persistence.*;

/**
 * Created by ASUS on 5/28/2015.
 */
@Entity
public class RequestAmenity {
    private int id;
    private int requestOfficeId;
    private int amenityId;
    private Amenity amenityByAmenityId;
    private RequestOffice requestOfficeByRequestOfficeId;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "RequestOfficeId")
    public int getRequestOfficeId() {
        return requestOfficeId;
    }

    public void setRequestOfficeId(int requestOfficeId) {
        this.requestOfficeId = requestOfficeId;
    }

    @Basic
    @Column(name = "AmenityId")
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

        RequestAmenity that = (RequestAmenity) o;

        if (id != that.id) return false;
        if (requestOfficeId != that.requestOfficeId) return false;
        if (amenityId != that.amenityId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + requestOfficeId;
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
    @JoinColumn(name = "RequestOfficeId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public RequestOffice getRequestOfficeByRequestOfficeId() {
        return requestOfficeByRequestOfficeId;
    }

    public void setRequestOfficeByRequestOfficeId(RequestOffice requestOfficeByRequestOfficeId) {
        this.requestOfficeByRequestOfficeId = requestOfficeByRequestOfficeId;
    }
}
