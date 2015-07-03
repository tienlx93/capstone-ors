package json;

/**
 * Created by ASUS on 6/27/2015.
 */
public class CalendarItemJSON {
    private int id;
    private int type;
    private String title;
    private String staff;
    private String start;
    private String url;

    public CalendarItemJSON() {
    }

    public CalendarItemJSON(int id, int type, String title, String staff, String start, String url) {
        this.id = id;
        this.type = type;
        this.title = title;
        this.staff = staff;
        this.start = start;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
