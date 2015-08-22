package json;

import java.util.Date;

/**
 * Created by Thành on 15/06/2015.
 */
public class ContractJSON {
    private int contractId;
    private int officeId;
    private String officeName;
    private Long startDay;
    private Long endDay;
    private double price;
    private String paymentTerm;
    private int status;
    private String address;
    private double area;
    private Long deposit;
    private String category;
    private String ownerName;
    private String ownerPhone;
    private String ownerAddress;
    private String imgUrl;

    public ContractJSON() {
    }

    public ContractJSON(int contractId, int officeId, String officeName, Long startDay, Long endDay, double price, String paymentTerm, int status, String address, double area, Long deposit, String category, String ownerName, String ownerPhone, String ownerAddress, String imgUrl) {
        this.contractId = contractId;
        this.officeId = officeId;
        this.officeName = officeName;
        this.startDay = startDay;
        this.endDay = endDay;
        this.price = price;
        this.paymentTerm = paymentTerm;
        this.status = status;
        this.address = address;
        this.area = area;
        this.deposit = deposit;
        this.category = category;
        this.ownerName = ownerName;
        this.ownerPhone = ownerPhone;
        this.ownerAddress = ownerAddress;
        this.imgUrl = imgUrl;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerPhone() {
        return ownerPhone;
    }

    public void setOwnerPhone(String ownerPhone) {
        this.ownerPhone = ownerPhone;
    }

    public String getOwnerAddress() {
        return ownerAddress;
    }

    public void setOwnerAddress(String ownerAddress) {
        this.ownerAddress = ownerAddress;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Long getDeposit() {
        return deposit;
    }

    public void setDeposit(Long deposit) {
        this.deposit = deposit;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public Long getStartDay() {
        return startDay;
    }

    public void setStartDay(Long startDay) {
        this.startDay = startDay;
    }

    public Long getEndDay() {
        return endDay;
    }

    public void setEndDay(Long endDay) {
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
