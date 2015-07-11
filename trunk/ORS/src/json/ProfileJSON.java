package json;

import java.sql.Timestamp;
/**
 * Created by Thành on 10/07/2015.
 */
public class ProfileJSON {
    private String username;
    private String title;
    private String fullName;
    private String company;
    private String phone;
    private String address;
    private Timestamp birthday;

    public ProfileJSON() {
    }

    public ProfileJSON(String username, String title, String fullName, String company, String phone, String address, Timestamp birthday) {
        this.username = username;
        this.title = title;
        this.fullName = fullName;
        this.company = company;
        this.phone = phone;
        this.address = address;
        this.birthday = birthday;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getBirthday() {
        return birthday;
    }

    public void setBirthday(Timestamp birthday) {
        this.birthday = birthday;
    }
}
