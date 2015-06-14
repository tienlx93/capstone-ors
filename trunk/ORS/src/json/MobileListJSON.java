package json;

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

    public MobileListJSON() {
    }

    public MobileListJSON(int id, String officeName, String address, String detail, String date, int status) {
        this.id = id;
        this.officeName = officeName;
        this.address = address;
        this.detail = detail;
        this.date = date;
        this.status = status;
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
}
