package json;

import entity.Office;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 * Created by ASUS on 6/14/2015.
 */
public class MobileListJSON {
    private int id;
    private String officeName;
    private String address;
    private String detail;
    private String date;
    private int status;
    private List<String> images;

    public MobileListJSON() {
    }

    public MobileListJSON(int id, String officeName, String address, String detail, String date, int status, Office office) {
        this.id = id;
        this.officeName = officeName;
        this.address = address;
        this.detail = detail;
        this.date = date;
        this.status = status;
        this.images = new ArrayList<>();
        StringTokenizer tokenizer = new StringTokenizer(office.getImageUrls(), ",");
        while (tokenizer.hasMoreElements()) {
            String img = (String) tokenizer.nextElement();
            if (img != null && img != "") {
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

    public String getOfficeName() {
        return officeName;
    }

    public void setOfficeName(String officeName) {
        this.officeName = officeName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }
}
