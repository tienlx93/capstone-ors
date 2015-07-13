package service;

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

    public int matching(double latitude, double longitude, long priceRange) {
        KMeans kMeans = clusteringService.getkMeans();
        List<NormalizePoint> normalizedData = clusteringService.getOfficeData();
        double[] distance = new double[normalizedData.size()];
        int dimension = 3;
        double[] queryPoint = new double[dimension];
        double[] rawInput = new double[]{latitude, longitude, priceRange};
        for (int i = 0; i < dimension; i++) {
            queryPoint[i] = (rawInput[i] - kMeans.getMins()[i]) / (kMeans.getMaxs()[i] - kMeans.getMins()[i]);
        }

        for (NormalizePoint office : normalizedData) {
            double[] officeDetail = office.getData();
            office.setDistance(MathUtil.euclideanDistance(queryPoint, officeDetail));
        }

        Collections.sort(normalizedData);


        int k = (clusteringService.getNumCluster() % 2 == 0) ? clusteringService.getNumCluster() + 1 :
                clusteringService.getNumCluster() + 2;
        k = 3;

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

        return weighted.get(0).getGroup();
    }
}
