package service;

import dao.OfficeDAO;
import entity.Office;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ASUS on 7/12/2015.
 */
public class ClusteringService {
    public ClusteringService() {
        OfficeDAO dao = new OfficeDAO();
        double[][] rawData;
        List<Double[]> listData = new ArrayList<>();

        for (Office office : dao.getAllOffice()) {
            
        }


    }
}
