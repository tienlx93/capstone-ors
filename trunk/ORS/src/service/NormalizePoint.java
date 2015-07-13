package service;

import entity.Office;

import java.io.Serializable;

/**
 * Created by ASUS on 7/13/2015.
 */
public class NormalizePoint implements Comparable<NormalizePoint>{
    private Office office;
    private double[] data;
    private double distance;

    public NormalizePoint() {
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    public double[] getData() {
        return data;
    }

    public void setData(double[] data) {
        this.data = data;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    @Override
    public int compareTo(NormalizePoint o) {
        return Double.compare(this.distance, o.getDistance());
    }
}
