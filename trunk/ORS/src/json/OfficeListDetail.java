package json;

import entity.Office;
import entity.OfficeAmenity;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 * Created by ASUS on 6/10/2015.
 */
public class OfficeListDetail {
    private int id;
    private String name;
    private String description;
    private List<AmenityJSON> amenityJSON;
    private List<String> amenityList;
    private Long price;
    private String priceTerm;
    private String address;
    private List<String> images;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    private String category;

    public OfficeListDetail() {
    }

    public OfficeListDetail(Office office) {
        this.id = office.getId();
        this.name = office.getName();
        this.description = office.getDescription();
        amenityJSON = new ArrayList<>();
        amenityList = new ArrayList<>();
        for (OfficeAmenity amenity : office.getOfficeAmenitiesById()) {
            String name = amenity.getAmenityByAmenityId().getName();
            Integer weight = amenity.getAmenityByAmenityId().getWeight();
            Integer group = amenity.getAmenityByAmenityId().getAmenityGroupId();
            amenityJSON.add(new AmenityJSON(name, weight!= null ? weight : -10, group!= null ? group : -10));
            amenityList.add(name);
        }

        this.price = office.getPrice();
        this.priceTerm = office.getPriceTermByPriceTerm().getDescription();
        this.address = office.getAddress();
        this.images = new ArrayList<>();
        StringTokenizer tokenizer = new StringTokenizer(office.getImageUrls(), ",");
        while (tokenizer.hasMoreElements()) {
            String img = (String) tokenizer.nextElement();
            if (img != null && !img.equals("")) {
                images.add(img);
            }
        }
        this.category = office.getCategoryByCategoryId().getDescription();
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

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<AmenityJSON> getAmenityJSON() {
        return amenityJSON;
    }

    public void setAmenityJSON(List<AmenityJSON> amenityJSON) {
        this.amenityJSON = amenityJSON;
    }

    public List<String> getAmenityList() {
        return amenityList;
    }

    public void setAmenityList(List<String> amenityList) {
        this.amenityList = amenityList;
    }
}
