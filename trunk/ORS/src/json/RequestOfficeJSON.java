package json;

import entity.Office;

import java.util.List;

/**
 * Created by xps on 7/22/2015.
 */
public class RequestOfficeJSON {
    private int id;
    private String customerUsername;
    private int categoryId;
    private int price;
    private Double area;
    private String district;
    private List<Office> officeSuggest;
    private boolean available;

    public RequestOfficeJSON() {
    }

    public RequestOfficeJSON(int id, String customerUsername, int categoryId, int price, Double area, String district, List<Office> officeSuggest, boolean available) {
        this.id = id;
        this.customerUsername = customerUsername;
        this.categoryId = categoryId;
        this.price = price;
        this.area = area;
        this.district = district;
        this.officeSuggest = officeSuggest;
        this.available = available;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerUsername() {
        return customerUsername;
    }

    public void setCustomerUsername(String customerUsername) {
        this.customerUsername = customerUsername;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public List<Office> getOfficeSuggest() {
        return officeSuggest;
    }

    public void setOfficeSuggest(List<Office> officeSuggest) {
        this.officeSuggest = officeSuggest;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}
