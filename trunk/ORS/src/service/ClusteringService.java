package service;

import dao.OfficeDAO;
import dao.OfficeGroupDAO;
import entity.Office;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ASUS on 7/12/2015.
 */
public class ClusteringService {
    private double[][] rawData;
    private int numCluster;
    private Integer[] officeIdList;
    private KMeans kMeans;
    private List<NormalizePoint> officeData;

    public ClusteringService() {
        OfficeDAO dao = new OfficeDAO();
        List<double[]> listData = new ArrayList<>();
        officeData = new ArrayList<>();
        double[] data;
        double price;
        List<Office> allOffice = dao.getAllOffice();
        officeIdList = new Integer[allOffice.size()];
        for (int i = 0; i < allOffice.size(); i++) {
            Office office = allOffice.get(i);
            officeIdList[i] = office.getId();
            //Normalize price
            switch (office.getPriceTerm()) {
                case 4:
                    price = 0;
                    break;
                case 1:
                    price = office.getPrice() / office.getArea();
                    break;
                default:
                    price = office.getPrice();
                    break;
            }
            if (price < 100000) {
                price = 0;
            } else if (price >= 100000 && price < 200000) {
                price = 1;
            } else if (price >= 200000 && price < 300000) {
                price = 2;
            } else if (price >= 300000 && price < 400000) {
                price = 3;
            } else if (price >= 400000 && price < 500000) {
                price = 4;
            } else if (price >= 500000) {
                price = 5;
            }
            data = new double[]{
                    office.getLatitude(),
                    office.getLongitude(),
                    price
            };
            officeData.add(new NormalizePoint());
            listData.add(data);
        }
        rawData = new double[listData.size()][];
        listData.toArray(rawData);
        //numCluster = dao.countDistrict();
        numCluster = (int) Math.round(Math.floor(Math.sqrt(allOffice.size())));
        kMeans = new KMeans(rawData, numCluster);
        for (int i = 0; i < officeData.size(); i++) {
            NormalizePoint point = officeData.get(i);
            point.setOffice(allOffice.get(i));
            point.setData(kMeans.getData()[i]);
        }

    }

    public int[] doCluster() {
        OfficeGroupDAO dao = new OfficeGroupDAO();
        dao.deleteAll();

        int[] clustering = kMeans.cluster();
        Integer[][] officeGroup = new Integer[rawData.length][];
        for (int i = 0; i < officeGroup.length; i++) {
            officeGroup[i] = new Integer[]{officeIdList[i], clustering[i]};
        }

        dao.insertAll(officeGroup);
        return clustering;
    }

    public List<NormalizePoint> getOfficeData() {
        return officeData;
    }

    public int getNumCluster() {
        return numCluster;
    }

    public KMeans getkMeans() {
        return kMeans;
    }
}
