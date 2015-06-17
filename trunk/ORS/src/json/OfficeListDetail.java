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
    private List<String> amenityList;
    private Long price;
    private String priceTerm;
    private String address;
    private List<String> images;

    public OfficeListDetail() {
    }

    public OfficeListDetail(int id, String name, String description, List<String> amenityList, Long price, String priceTerm,String address ,List<String> images) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.amenityList = amenityList;
        this.price = price;
        this.priceTerm = priceTerm;
        this.address = address;
        this.images = images;
    }

    public OfficeListDetail(Office office) {
        this.id = office.getId();
        this.name = office.getName();
        this.description = office.getDescription();
        this.amenityList = new ArrayList<>();
        for (OfficeAmenity amenity : office.getOfficeAmenitiesById()) {
            amenityList.add(amenity.getAmenityByAmenityId().getName());
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

    public List<String> getAmenityList() {
        return amenityList;
    }

    public void setAmenityList(List<String> amenityList) {
        this.amenityList = amenityList;
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
}
