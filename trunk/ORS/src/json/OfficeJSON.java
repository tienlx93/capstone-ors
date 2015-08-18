package json;

import entity.Office;
import entity.OfficeAmenity;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 * Created by ASUS on 6/9/2015.
 */
public class OfficeJSON {
    private int id;
    private String name;
    private String description;
    private Long price;
    private String priceTerm;
    private int floorNumber;
    private double area;
    private String otherDetail;
    private String address;
    private Double latitude;
    private Double longitude;
    private String district;
    private String city;
    private String category;
    private List<String> amenities;
    private List<String> images;
    private String status;
    private Double minArea;
    private int minTime;

    public OfficeJSON() {
    }

    public OfficeJSON(Office office) {
        this.id = office.getId();
        this.name = office.getName();
        this.description = office.getDescription();
        this.price = office.getPrice();
        this.priceTerm = office.getPriceTermByPriceTerm().getDescription();
        this.floorNumber = office.getFloorNumber();
        this.area = office.getArea();
        this.address = office.getAddress();
        this.latitude = office.getLatitude();
        this.longitude = office.getLongitude();
        this.minArea = office.getMinArea();
        this.minTime = office.getMinTime();
        this.district = office.getDistrict();
        this.city = office.getCity();
        this.category = office.getCategoryByCategoryId().getDescription();
        this.amenities = new ArrayList<>();
        for (OfficeAmenity amenity : office.getOfficeAmenitiesById()) {
            if (amenity.getAmenityByAmenityId().getAmenityGroupId() != 3) {
                this.amenities.add(amenity.getAmenityByAmenityId().getName());
            }
        }
        this.images = new ArrayList<>();
        StringTokenizer tokenizer = new StringTokenizer(office.getImageUrls(), ",");
        while (tokenizer.hasMoreElements()) {
            String img = (String) tokenizer.nextElement();
            if (img != null && img != "") {
                images.add(img);
            }
        }
        this.status = office.getOfficeStatusByStatusId().getDescription();

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getPriceTerm() {
        return priceTerm;
    }

    public void setPriceTerm(String priceTerm) {
        this.priceTerm = priceTerm;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getOtherDetail() {
        return otherDetail;
    }

    public void setOtherDetail(String otherDetail) {
        this.otherDetail = otherDetail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public List<String> getAmenities() {
        return amenities;
    }

    public void setAmenities(List<String> amenities) {
        this.amenities = amenities;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getMinTime() {
        return minTime;
    }

    public void setMinTime(int minTime) {
        this.minTime = minTime;
    }

    public double getMinArea() {
        return minArea;
    }

    public void setMinArea(double minArea) {
        this.minArea = minArea;
    }
}
