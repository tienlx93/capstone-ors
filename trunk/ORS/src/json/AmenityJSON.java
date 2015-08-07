package json;

/**
 * Created by ASUS on 8/7/2015.
 */
public class AmenityJSON {
    private String amenity;
    private int weight;
    private int group;

    public AmenityJSON(String amenity, int weight, int group) {
        this.amenity = amenity;
        this.weight = weight;
        this.group = group;
    }

    public String getAmenity() {
        return amenity;
    }

    public void setAmenity(String amenity) {
        this.amenity = amenity;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getGroup() {
        return group;
    }

    public void setGroup(int group) {
        this.group = group;
    }
}
