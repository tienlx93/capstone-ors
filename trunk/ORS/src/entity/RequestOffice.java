package entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class RequestOffice {
    private int id;
    private String customerUsername;
    private int categoryId;
    private Integer price;
    private Double area;
    private Collection<RequestAmenity> requestAmenitiesById;
    private Account accountByCustomerUsername;
    private Category categoryByCategoryId;
    private String district;
    private Timestamp createDate;
    private Timestamp scheduleDate;
    private String officeSuggested;
    private boolean available;

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
    @Column(name = "CustomerUsername", nullable = false, insertable = true, updatable = true)
    public String getCustomerUsername() {
        return customerUsername;
    }

    public void setCustomerUsername(String customerUsername) {
        this.customerUsername = customerUsername;
    }

    @Basic
    @Column(name = "CategoryId", nullable = true, insertable = true, updatable = true)
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "Price", nullable = true, insertable = true, updatable = true)
    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Basic
    @Column(name = "Area", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RequestOffice that = (RequestOffice) o;

        if (id != that.id) return false;
        if (categoryId != that.categoryId) return false;
        if (customerUsername != null ? !customerUsername.equals(that.customerUsername) : that.customerUsername != null)
            return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (area != null ? !area.equals(that.area) : that.area != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (customerUsername != null ? customerUsername.hashCode() : 0);
        result = 31 * result + categoryId;
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (area != null ? area.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "requestOfficeByRequestOfficeId")
    public Collection<RequestAmenity> getRequestAmenitiesById() {
        return requestAmenitiesById;
    }

    public void setRequestAmenitiesById(Collection<RequestAmenity> requestAmenitiesById) {
        this.requestAmenitiesById = requestAmenitiesById;
    }

    @ManyToOne
    @JoinColumn(name = "CustomerUsername", referencedColumnName = "Username", nullable = false, insertable = false, updatable = false)
    public Account getAccountByCustomerUsername() {
        return accountByCustomerUsername;
    }

    public void setAccountByCustomerUsername(Account accountByCustomerUsername) {
        this.accountByCustomerUsername = accountByCustomerUsername;
    }

    @ManyToOne
    @JoinColumn(name = "CategoryId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Category getCategoryByCategoryId() {
        return categoryByCategoryId;
    }

    public void setCategoryByCategoryId(Category categoryByCategoryId) {
        this.categoryByCategoryId = categoryByCategoryId;
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
    @Column(name = "CreateDate", nullable = false, insertable = true, updatable = true)
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "ScheduleDate", nullable = true, insertable = true, updatable = true)
    public Timestamp getScheduleDate() {
        return scheduleDate;
    }

    public void setScheduleDate(Timestamp scheduleDate) {
        this.scheduleDate = scheduleDate;
    }

    @Basic
    @Column(name = "OfficeSuggested", nullable = true, insertable = true, updatable = true)
    public String getOfficeSuggested() {
        return officeSuggested;
    }

    public void setOfficeSuggested(String officeSuggested) {
        this.officeSuggested = officeSuggested;
    }

    @Basic
    @Column(name = "Available", nullable = false, insertable = true, updatable = true)
    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

}
