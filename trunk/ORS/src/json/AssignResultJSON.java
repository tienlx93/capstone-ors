package json;

import java.util.Date;

/**
 * Created by ASUS on 8/30/2015.
 */
public class AssignResultJSON {
    public int jobCount;
    public Date nearJob;
    public int status;

    public static final int STATUS_CONFIRM = 0;
    public static final int STATUS_UNAVAILABLE_JOBCOUNT = -1;
    public static final int STATUS_UNAVAILABLE_NEARJOB = -2;
    public static final int STATUS_UNAVAILABLE_ALL = -3;
    public static final int STATUS_AVAILABLE = 1;
}
