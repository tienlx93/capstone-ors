package entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class Office {
    private int id;
    private String name;
    private int categoryId;
    private int statusId;
    private String description;
    private Long price;
    private int priceTerm;
    private int floorNumber;
    private double area;
    private String imageUrls;
    private String otherDetail;
    private String address;
    private Double latitude;
    private Double longitude;
    private String district;
    private String city;
    private Integer parentOfficeId;
    private Collection<Appointment> appointmentsById;
    private Collection<Contract> contractsById;
    private Category categoryByCategoryId;
    private Office officeByParentOfficeId;
    private Collection<Office> officesById;
    private OfficeStatus officeStatusByStatusId;
    private PriceTerm priceTermByPriceTerm;
    private Collection<OfficeAmenity> officeAmenitiesById;
    private Timestamp createDate;

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
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
    @Column(name = "CategoryId", nullable = false, insertable = true, updatable = true)
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "StatusId", nullable = false, insertable = true, updatable = true)
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Basic
    @Column(name = "Description", nullable = false, insertable = true, updatable = true)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "Price", nullable = true, insertable = true, updatable = true)
    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    @Basic
    @Column(name = "PriceTerm", nullable = false, insertable = true, updatable = true)
    public int getPriceTerm() {
        return priceTerm;
    }

    public void setPriceTerm(int priceTerm) {
        this.priceTerm = priceTerm;
    }

    @Basic
    @Column(name = "FloorNumber", nullable = false, insertable = true, updatable = true)
    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    @Basic
    @Column(name = "Area", nullable = false, insertable = true, updatable = true, precision = 0)
    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    @Basic
    @Column(name = "ImageUrls", nullable = true, insertable = true, updatable = true, length = 2147483647)
    public String getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(String imageUrls) {
        this.imageUrls = imageUrls;
    }

    @Basic
    @Column(name = "OtherDetail", nullable = true, insertable = true, updatable = true)
    public String getOtherDetail() {
        return otherDetail;
    }

    public void setOtherDetail(String otherDetail) {
        this.otherDetail = otherDetail;
    }

    @Basic
    @Column(name = "Address", nullable = false, insertable = true, updatable = true)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "Latitude", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    @Basic
    @Column(name = "Longitude", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    @Basic
    @Column(name = "District", nullable = true, insertable = true, updatable = true)
    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    @Basic
    @Column(name = "City", nullable = true, insertable = true, updatable = true)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "ParentOfficeId", nullable = true, insertable = true, updatable = true)
    public Integer getParentOfficeId() {
        return parentOfficeId;
    }

    public void setParentOfficeId(Integer parentOfficeId) {
        this.parentOfficeId = parentOfficeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Office office = (Office) o;

        if (id != office.id) return false;
        if (categoryId != office.categoryId) return false;
        if (statusId != office.statusId) return false;
        if (priceTerm != office.priceTerm) return false;
        if (floorNumber != office.floorNumber) return false;
        if (Double.compare(office.area, area) != 0) return false;
        if (name != null ? !name.equals(office.name) : office.name != null) return false;
        if (description != null ? !description.equals(office.description) : office.description != null) return false;
        if (price != null ? !price.equals(office.price) : office.price != null) return false;
        if (imageUrls != null ? !imageUrls.equals(office.imageUrls) : office.imageUrls != null) return false;
        if (otherDetail != null ? !otherDetail.equals(office.otherDetail) : office.otherDetail != null) return false;
        if (address != null ? !address.equals(office.address) : office.address != null) return false;
        if (latitude != null ? !latitude.equals(office.latitude) : office.latitude != null) return false;
        if (longitude != null ? !longitude.equals(office.longitude) : office.longitude != null) return false;
        if (district != null ? !district.equals(office.district) : office.district != null) return false;
        if (city != null ? !city.equals(office.city) : office.city != null) return false;
        if (parentOfficeId != null ? !parentOfficeId.equals(office.parentOfficeId) : office.parentOfficeId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + categoryId;
        result = 31 * result + statusId;
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + priceTerm;
        result = 31 * result + floorNumber;
        temp = Double.doubleToLongBits(area);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (imageUrls != null ? imageUrls.hashCode() : 0);
        result = 31 * result + (otherDetail != null ? otherDetail.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (latitude != null ? latitude.hashCode() : 0);
        result = 31 * result + (longitude != null ? longitude.hashCode() : 0);
        result = 31 * result + (district != null ? district.hashCode() : 0);
        result = 31 * result + (city != null ? city.hashCode() : 0);
        result = 31 * result + (parentOfficeId != null ? parentOfficeId.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "officeByOfficeId")
    public Collection<Appointment> getAppointmentsById() {
        return appointmentsById;
    }

    public void setAppointmentsById(Collection<Appointment> appointmentsById) {
        this.appointmentsById = appointmentsById;
    }

    @OneToMany(mappedBy = "officeByOfficeId")
    public Collection<Contract> getContractsById() {
        return contractsById;
    }

    public void setContractsById(Collection<Contract> contractsById) {
        this.contractsById = contractsById;
    }

    @ManyToOne
    @JoinColumn(name = "CategoryId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Category getCategoryByCategoryId() {
        return categoryByCategoryId;
    }

    public void setCategoryByCategoryId(Category categoryByCategoryId) {
        this.categoryByCategoryId = categoryByCategoryId;
    }

    @ManyToOne
    @JoinColumn(name = "ParentOfficeId", referencedColumnName = "Id", insertable = false, updatable = false)
    public Office getOfficeByParentOfficeId() {
        return officeByParentOfficeId;
    }

    public void setOfficeByParentOfficeId(Office officeByParentOfficeId) {
        this.officeByParentOfficeId = officeByParentOfficeId;
    }

    @OneToMany(mappedBy = "officeByParentOfficeId")
    public Collection<Office> getOfficesById() {
        return officesById;
    }

    public void setOfficesById(Collection<Office> officesById) {
        this.officesById = officesById;
    }

    @ManyToOne
    @JoinColumn(name = "StatusId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public OfficeStatus getOfficeStatusByStatusId() {
        return officeStatusByStatusId;
    }

    public void setOfficeStatusByStatusId(OfficeStatus officeStatusByStatusId) {
        this.officeStatusByStatusId = officeStatusByStatusId;
    }

    @ManyToOne
    @JoinColumn(name = "PriceTerm", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public PriceTerm getPriceTermByPriceTerm() {
        return priceTermByPriceTerm;
    }

    public void setPriceTermByPriceTerm(PriceTerm priceTermByPriceTerm) {
        this.priceTermByPriceTerm = priceTermByPriceTerm;
    }

    @OneToMany(mappedBy = "officeByOfficeId")
    public Collection<OfficeAmenity> getOfficeAmenitiesById() {
        return officeAmenitiesById;
    }

    public void setOfficeAmenitiesById(Collection<OfficeAmenity> officeAmenitiesById) {
        this.officeAmenitiesById = officeAmenitiesById;
    }

    @Basic
    @Column(name = "CreateDate", nullable = false, insertable = true, updatable = true)
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }
}
