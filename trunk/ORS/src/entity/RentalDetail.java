package entity;

import javax.persistence.*;

/**
 * Created by ASUS on 6/8/2015.
 */
@Entity
public class RentalDetail {
    private int id;
    private int rentalItemId;
    private int rentalId;
    private Double unitPrice;
    private Integer quantity;
    private Rental rentalByRentalId;
    private RentalItem rentalItemByRentalItemId;

    @Id
    @Column(name = "Id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "RentalItemId", nullable = false, insertable = true, updatable = true)
    public int getRentalItemId() {
        return rentalItemId;
    }

    public void setRentalItemId(int rentalItemId) {
        this.rentalItemId = rentalItemId;
    }

    @Basic
    @Column(name = "RentalId", nullable = false, insertable = true, updatable = true)
    public int getRentalId() {
        return rentalId;
    }

    public void setRentalId(int rentalId) {
        this.rentalId = rentalId;
    }

    @Basic
    @Column(name = "UnitPrice", nullable = true, insertable = true, updatable = true, precision = 0)
    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
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

        RentalDetail that = (RentalDetail) o;

        if (id != that.id) return false;
        if (rentalItemId != that.rentalItemId) return false;
        if (rentalId != that.rentalId) return false;
        if (unitPrice != null ? !unitPrice.equals(that.unitPrice) : that.unitPrice != null) return false;
        if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + rentalItemId;
        result = 31 * result + rentalId;
        result = 31 * result + (unitPrice != null ? unitPrice.hashCode() : 0);
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "RentalId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Rental getRentalByRentalId() {
        return rentalByRentalId;
    }

    public void setRentalByRentalId(Rental rentalByRentalId) {
        this.rentalByRentalId = rentalByRentalId;
    }

    @ManyToOne
    @JoinColumn(name = "RentalItemId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public RentalItem getRentalItemByRentalItemId() {
        return rentalItemByRentalItemId;
    }

    public void setRentalItemByRentalItemId(RentalItem rentalItemByRentalItemId) {
        this.rentalItemByRentalItemId = rentalItemByRentalItemId;
    }
}
