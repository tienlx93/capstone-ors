package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 6/1/2015.
 */
@Entity
public class Category {
    private int id;
    private String name;
    private String description;
    private Collection<RequestOffice> requestOfficesById;
    private Collection<Office> officesById;

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
    @Column(name = "Description", nullable = false, insertable = true, updatable = true)
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

        Category category = (Category) o;

        if (id != category.id) return false;
        if (name != null ? !name.equals(category.name) : category.name != null) return false;
        if (description != null ? !description.equals(category.description) : category.description != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "categoryByCategoryId")
    public Collection<RequestOffice> getRequestOfficesById() {
        return requestOfficesById;
    }

    public void setRequestOfficesById(Collection<RequestOffice> requestOfficesById) {
        this.requestOfficesById = requestOfficesById;
    }

    @OneToMany(mappedBy = "categoryByCategoryId")
    public Collection<Office> getOfficesById() {
        return officesById;
    }

    public void setOfficesById(Collection<Office> officesById) {
        this.officesById = officesById;
    }
}
