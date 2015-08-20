package json;

import java.util.Date;

/**
 * Created by Thành on 19/06/2015.
 */
public class RentalListJSON {
    private int rentalId;
    private String name;
    private String description;
    private double unitPrice;
    private int quantity;
    private String imageUrl;
    private String status;
    private double price;
    private Long assignedTime;
    private Long createTime;
    private String officeName;
    private int officeType;

    public RentalListJSON() {
    }

    public RentalListJSON(int rentalId, String name, String description, double unitPrice, int quantity, String imageUrl, String status, double price, Date assignedTime, Date createTime, String officeName, int officeType) {
        this.rentalId = rentalId;
        this.name = name;
        this.description = description;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.status = status;
        this.price = price;
        this.assignedTime = assignedTime != null ? assignedTime.getTime() : 0;
        this.createTime = createTime != null ? createTime.getTime() : 0;
        this.officeName = officeName;
        this.officeType = officeType;
    }

    public String getOfficeName() {
        return officeName;
    }

    public void setOfficeName(String officeName) {
        this.officeName = officeName;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public Long getAssignedTime() {
        return assignedTime;
    }

    public void setAssignedTime(Long assignedTime) {
        this.assignedTime = assignedTime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRentalId() {
        return rentalId;
    }

    public void setRentalId(int rentalId) {
        this.rentalId = rentalId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getOfficeType() {
        return officeType;
    }

    public void setOfficeType(int officeType) {
        this.officeType = officeType;
    }
}
