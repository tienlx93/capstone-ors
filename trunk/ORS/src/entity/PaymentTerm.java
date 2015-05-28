package entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by ASUS on 5/28/2015.
 */
@Entity
public class PaymentTerm {
    private int id;
    private String name;
    private int paymentTime;
    private String description;
    private Collection<Contract> contractsById;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "PaymentTime")
    public int getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(int paymentTime) {
        this.paymentTime = paymentTime;
    }

    @Basic
    @Column(name = "Description")
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

        PaymentTerm that = (PaymentTerm) o;

        if (id != that.id) return false;
        if (paymentTime != that.paymentTime) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + paymentTime;
        result = 31 * result + (description != null ? description.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "paymentTermByPaymentTerm")
    public Collection<Contract> getContractsById() {
        return contractsById;
    }

    public void setContractsById(Collection<Contract> contractsById) {
        this.contractsById = contractsById;
    }
}
