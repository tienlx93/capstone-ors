package json;

import java.util.Date;

/**
 * Created by Thành on 19/06/2015.
 */
public class RepairListJSON {
    private int repairId;
    private String description;
    private Date createTime;
    private String assignStaff;

    public RepairListJSON() {
    }

    public RepairListJSON(int repairId, String description, Date createTime, String assignStaff) {
        this.repairId = repairId;
        this.description = description;
        this.createTime = createTime;
        this.assignStaff = assignStaff;
    }

    public int getRepairId() {
        return repairId;
    }

    public void setRepairId(int repairId) {
        this.repairId = repairId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getAssignStaff() {
        return assignStaff;
    }

    public void setAssignStaff(String assignStaff) {
        this.assignStaff = assignStaff;
    }
}
