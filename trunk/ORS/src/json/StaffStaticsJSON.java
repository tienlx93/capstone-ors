package json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ASUS on 7/19/2015.
 */
public class StaffStaticsJSON {
    private List<String> dates;
    private List<StaffStaticDetail> map;
    private int count;

    public StaffStaticsJSON() {
    }

    public StaffStaticsJSON(int count) {
        this.count = count;
        dates = new ArrayList<>(count);
        map = new ArrayList<>();
    }

    public List<String> getDates() {
        return dates;
    }

    public void setDates(List<String> dates) {
        this.dates = dates;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<StaffStaticDetail> getMap() {
        return map;
    }

    public void setMap(List<StaffStaticDetail> map) {
        this.map = map;
    }
}
