package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 6/10/2015.
 */
@Entity
public class RentalStatus {
    private int id;
    private String name;
    private String description;
    private Collection<Rental> rentalsById;

    @Id
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

        RentalStatus that = (RentalStatus) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "rentalStatusByStatusId")
    public Collection<Rental> getRentalsById() {
        return rentalsById;
    }

    public void setRentalsById(Collection<Rental> rentalsById) {
        this.rentalsById = rentalsById;
    }
}
