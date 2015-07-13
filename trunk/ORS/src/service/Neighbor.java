package service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ASUS on 7/13/2015.
 */
public class Neighbor implements Comparable<Neighbor> {
    private int group;
    private List<Double> distances;

    public Neighbor() {
    }

    public Neighbor(int group) {
        this.group = group;
        distances = new ArrayList<>();
    }

    public int getGroup() {
        return group;
    }

    public void setGroup(int group) {
        this.group = group;
    }

    public List<Double> getDistances() {
        return distances;
    }

    public void setDistances(List<Double> distances) {
        this.distances = distances;
    }

    @Override
    public int compareTo(Neighbor o) {
        if (this.distances.size() > o.getDistances().size()) {
            return -1;
        } else if (this.distances.size() > o.getDistances().size()) {
            return 1;
        } else {
            double thisLength = 0;
            double thatLength = 0;
            for (int i = 0; i < this.distances.size(); i++) {
                thisLength += this.distances.get(i);
                thatLength += o.getDistances().get(i);
            }
            return Double.compare(thisLength, thatLength);
        }
    }
}
