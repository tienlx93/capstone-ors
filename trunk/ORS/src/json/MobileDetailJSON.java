package json;

import entity.Appointment;
import entity.Rental;
import entity.Repair;

import java.util.List;

/**
 * Created by ASUS on 6/14/2015.
 */
public class MobileDetailJSON {
    private int id;
    private String officeName;
    private String address;
    private double latitude;
    private double longitude;
    private String customerName;
    private String detail;
    private String date;
    private int status;
    private List<String> list;

    public MobileDetailJSON() {
    }

    public MobileDetailJSON(int id, String officeName, String address, double latitude, double longitude, String customerName, String detail, String date, int status, List<String> list) {
        this.id = id;
        this.officeName = officeName;
        this.address = address;
        this.latitude = latitude;
        this.longitude = longitude;
        this.customerName = customerName;
        this.detail = detail;
        this.date = date;
        this.status = status;
        this.list = list;
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

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
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

    public List<String> getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }
}
