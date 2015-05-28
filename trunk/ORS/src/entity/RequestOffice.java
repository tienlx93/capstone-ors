package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 5/28/2015.
 */
@Entity
public class RequestOffice {
    private int id;
    private String customerUsername;
    private int categoryId;
    private Integer price;
    private Double area;
    private String address;
    private Collection<RequestAmenity> requestAmenitiesById;
    private Account accountByCustomerUsername;
    private Category categoryByCategoryId;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "CustomerUsername")
    public String getCustomerUsername() {
        return customerUsername;
    }

    public void setCustomerUsername(String customerUsername) {
        this.customerUsername = customerUsername;
    }

    @Basic
    @Column(name = "CategoryId")
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "Price")
    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Basic
    @Column(name = "Area")
    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    @Basic
    @Column(name = "Address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
        if (address != null ? !address.equals(that.address) : that.address != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (customerUsername != null ? customerUsername.hashCode() : 0);
        result = 31 * result + categoryId;
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (area != null ? area.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
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
}
