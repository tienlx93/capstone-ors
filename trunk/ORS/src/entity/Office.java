package entity;

import javax.persistence.*;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class Office {
    private int id;

    @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
    @javax.persistence.Column(name = "Id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String name;

    @Basic
    @javax.persistence.Column(name = "Name", nullable = false, insertable = true, updatable = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String managerAccount;

    @Basic
    @javax.persistence.Column(name = "ManagerAccount", nullable = false, insertable = true, updatable = true)
    public String getManagerAccount() {
        return managerAccount;
    }

    public void setManagerAccount(String managerAccount) {
        this.managerAccount = managerAccount;
    }

    private int categoryId;

    @Basic
    @javax.persistence.Column(name = "CategoryId", nullable = false, insertable = true, updatable = true)
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    private int statusId;

    @Basic
    @javax.persistence.Column(name = "StatusId", nullable = false, insertable = true, updatable = true)
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    private String description;

    @Basic
    @javax.persistence.Column(name = "Description", nullable = false, insertable = true, updatable = true)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    private Long price;

    @Basic
    @javax.persistence.Column(name = "Price", nullable = true, insertable = true, updatable = true)
    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    private int priceTerm;

    @Basic
    @javax.persistence.Column(name = "PriceTerm", nullable = false, insertable = true, updatable = true)
    public int getPriceTerm() {
        return priceTerm;
    }

    public void setPriceTerm(int priceTerm) {
        this.priceTerm = priceTerm;
    }

    private int floorNumber;

    @Basic
    @javax.persistence.Column(name = "FloorNumber", nullable = false, insertable = true, updatable = true)
    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    private double area;

    @Basic
    @javax.persistence.Column(name = "Area", nullable = false, insertable = true, updatable = true, precision = 0)
    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    private String imageUrls;

    @Basic
    @javax.persistence.Column(name = "ImageUrls", nullable = false, insertable = true, updatable = true, length = 2147483647)
    public String getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(String imageUrls) {
        this.imageUrls = imageUrls;
    }

    private String otherDetail;

    @Basic
    @javax.persistence.Column(name = "OtherDetail", nullable = true, insertable = true, updatable = true)
    public String getOtherDetail() {
        return otherDetail;
    }

    public void setOtherDetail(String otherDetail) {
        this.otherDetail = otherDetail;
    }

    private String address;

    @Basic
    @javax.persistence.Column(name = "Address", nullable = false, insertable = true, updatable = true)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    private Double latitude;

    @Basic
    @javax.persistence.Column(name = "Latitude", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    private Double longitude;

    @Basic
    @javax.persistence.Column(name = "Longitude", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    private String district;

    @Basic
    @javax.persistence.Column(name = "District", nullable = true, insertable = true, updatable = true)
    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    private String city;

    @Basic
    @javax.persistence.Column(name = "City", nullable = true, insertable = true, updatable = true)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    private Integer parentOfficeId;

    @Basic
    @javax.persistence.Column(name = "ParentOfficeId", nullable = true, insertable = true, updatable = true)
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
        if (managerAccount != null ? !managerAccount.equals(office.managerAccount) : office.managerAccount != null)
            return false;
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
        result = 31 * result + (managerAccount != null ? managerAccount.hashCode() : 0);
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
}
