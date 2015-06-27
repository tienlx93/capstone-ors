package json;

import java.util.List;

/**
 * Created by ASUS on 6/27/2015.
 */
public class CalendarJSON {
    private List<CalendarItemJSON> itemList;
    private String staff;

    public CalendarJSON() {
    }

    public CalendarJSON(String staff) {
        this.staff = staff;
    }

    public List<CalendarItemJSON> getItemList() {
        return itemList;
    }

    public void setItemList(List<CalendarItemJSON> itemList) {
        this.itemList = itemList;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }
}
