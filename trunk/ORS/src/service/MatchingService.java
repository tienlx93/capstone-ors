package service;

import entity.Office;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by ASUS on 7/12/2015.
 */
public class MatchingService {
    private ClusteringService clusteringService;

    public MatchingService() {
        clusteringService = new ClusteringService();

    }

    public List<Office> matching(double latitude, double longitude, long priceRange) {
        KMeans kMeans = clusteringService.getkMeans();
        List<NormalizePoint> normalizedData = clusteringService.getOfficeData();
        int dimension = 3;
        double[] queryPoint = new double[dimension];
        double[] rawInput = new double[]{latitude, longitude, priceRange};
        // normalize input point
        for (int i = 0; i < dimension; i++) {
            queryPoint[i] = (rawInput[i] - kMeans.getMins()[i]) / (kMeans.getMaxs()[i] - kMeans.getMins()[i]);
        }
        // calculate distance
        for (NormalizePoint office : normalizedData) {
            double[] officeDetail = office.getData();
            office.setDistance(MathUtil.euclideanDistance(queryPoint, officeDetail));
        }

        Collections.sort(normalizedData);

        int k = clusteringService.getNumCluster() / 2 + 1;

        //List and sort k nearest neighbor
        List<Neighbor> weighted = new ArrayList<>();
        for (int j = 0; j < k; j++) {
            NormalizePoint office = normalizedData.get(j);
            int group = office.getOffice().getOfficeGroupById().getOfficeGroup();
            Neighbor found = null;
            for (Neighbor neighbor : weighted) {
                if (neighbor.getGroup() == group) {
                    found = neighbor;
                }
            }
            if (found == null) {
                found = new Neighbor(group);
                weighted.add(found);
            }
            found.getDistances().add(office.getDistance());
        }
        Collections.sort(weighted);

        //List and sort the distance of found group
        int group = weighted.get(0).getGroup();
        List<NormalizePoint> foundList = new ArrayList<>();
        for (NormalizePoint normalizePoint : normalizedData) {
            if (normalizePoint.getOffice().getOfficeGroupById()!= null && normalizePoint.getOffice().getOfficeGroupById().getOfficeGroup() == group) {
                foundList.add(normalizePoint);
            }
        }
        Collections.sort(foundList);

        List<Office> foundOffice = new ArrayList<>();
        for (NormalizePoint normalizePoint : foundList) {
            foundOffice.add(normalizePoint.getOffice());
        }

        return foundOffice;
    }
}
