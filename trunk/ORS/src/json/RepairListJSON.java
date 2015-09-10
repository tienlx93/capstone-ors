package json;

import entity.Amenity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Thành on 19/06/2015.
 */
public class RepairListJSON {
    private int repairId;
    private String description;
    private Long createTime;
    private String assignStaff;
    private Long assignedTime;
    private String status;
    private String officeName;
    private List<String> list;

    public RepairListJSON(int repairId, String description, Date createTime, String assignStaff, Date assignedTime, String status, String officeName, List<String> list) {
        this.repairId = repairId;
        this.description = description;
        this.createTime = createTime != null ? createTime.getTime() : 0;
        this.assignStaff = assignStaff;
        this.assignedTime = assignedTime != null ? assignedTime.getTime() : 0;
        this.status = status;
        this.officeName = officeName;
        this.list = list;
    }

    public List<String> getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }

    public String getOfficeName() {
        return officeName;
    }

    public void setOfficeName(String officeName) {
        this.officeName = officeName;
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

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public String getAssignStaff() {
        return assignStaff;
    }

    public void setAssignStaff(String assignStaff) {
        this.assignStaff = assignStaff;
    }

    public Long getAssignedTime() {
        return assignedTime;
    }

    public void setAssignedTime(Long assignedTime) {
        this.assignedTime = assignedTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
