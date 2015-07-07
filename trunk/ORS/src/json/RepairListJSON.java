package json;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Thành on 19/06/2015.
 */
public class RepairListJSON {
    private int repairId;
    private String description;
    private Date createTime;
    private String assignStaff;
    private Date assignedTime;
    private String status;

    public RepairListJSON(int repairId, String description, Date createTime, String assignStaff, Date assignedTime, String status) {
        this.repairId = repairId;
        this.description = description;
        this.createTime = createTime;
        this.assignStaff = assignStaff;
        this.assignedTime = assignedTime;
        this.status = status;
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

    public Date getAssignedTime() {
        return assignedTime;
    }

    public void setAssignedTime(Date assignedTime) {
        this.assignedTime = assignedTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
