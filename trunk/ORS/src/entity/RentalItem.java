package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 6/8/2015.
 */
@Entity
public class RentalItem {
    private int id;
    private String name;
    private String description;
    private Double price;
    private Integer quantity;
    private Collection<RentalDetail> rentalDetailsById;
    private String imageUrl;
    private int officeType;
    private Integer groupId;
    private RentalItemGroup rentalItemGroupByGroupId;

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
    @Column(name = "Description", nullable = true, insertable = true, updatable = true)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "Price", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "Quantity", nullable = true, insertable = true, updatable = true)
    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RentalItem that = (RentalItem) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "rentalItemByRentalItemId")
    public Collection<RentalDetail> getRentalDetailsById() {
        return rentalDetailsById;
    }

    public void setRentalDetailsById(Collection<RentalDetail> rentalDetailsById) {
        this.rentalDetailsById = rentalDetailsById;
    }

    @Basic
    @Column(name = "ImageUrl", nullable = true, insertable = true, updatable = true)
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Basic
    @Column(name = "OfficeType", nullable = true, insertable = true, updatable = true)
    public int getOfficeType() {
        return officeType;
    }

    public void setOfficeType(int officeType) {
        this.officeType = officeType;
    }

    @Basic
    @Column(name = "GroupId", nullable = true, insertable = true, updatable = true)
    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    @ManyToOne
    @JoinColumn(name = "GroupId", referencedColumnName = "Id", insertable = false, updatable = false)
    public RentalItemGroup getRentalItemGroupByGroupId() {
        return rentalItemGroupByGroupId;
    }

    public void setRentalItemGroupByGroupId(RentalItemGroup rentalItemGroupByGroupId) {
        this.rentalItemGroupByGroupId = rentalItemGroupByGroupId;
    }
}
