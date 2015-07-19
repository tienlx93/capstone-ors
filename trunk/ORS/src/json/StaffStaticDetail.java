package json;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ASUS on 7/19/2015.
 */
public class StaffStaticDetail {
    private String name;
    private List<Integer> data;

    public StaffStaticDetail() {
    }

    public StaffStaticDetail(String name) {
        this.name = name;
        this.data = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Integer> getData() {
        return data;
    }

    public void setData(List<Integer> data) {
        this.data = data;
    }
}
