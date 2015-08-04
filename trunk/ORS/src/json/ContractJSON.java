package json;

import java.util.Date;

/**
 * Created by Thành on 15/06/2015.
 */
public class ContractJSON {
    private int contractId;
    private int officeId;
    private String officeName;
    private Date startDay;
    private Date endDay;
    private double price;
    private String paymentTerm;
    private int status;

    public ContractJSON() {
    }

    public ContractJSON(int contractId, int officeId, String officeName, Date startDay, Date endDay, double price, String paymentTerm, int status) {
        this.contractId = contractId;
        this.officeId = officeId;
        this.officeName = officeName;
        this.startDay = startDay;
        this.endDay = endDay;
        this.price = price;
        this.paymentTerm = paymentTerm;
        this.status = status;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getOfficeId() {
        return officeId;
    }

    public void setOfficeId(int officeId) {
        this.officeId = officeId;
    }

    public String getOfficeName() {
        return officeName;
    }

    public void setOfficeName(String officeName) {
        this.officeName = officeName;
    }

    public Date getStartDay() {
        return startDay;
    }

    public void setStartDay(Date startDay) {
        this.startDay = startDay;
    }

    public Date getEndDay() {
        return endDay;
    }

    public void setEndDay(Date endDay) {
        this.endDay = endDay;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPaymentTerm() {
        return paymentTerm;
    }

    public void setPaymentTerm(String priceTerm) {
        this.paymentTerm = paymentTerm;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
