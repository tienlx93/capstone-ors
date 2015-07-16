package service;

import dao.OfficeDAO;
import entity.Office;

/**
 * Created by ASUS on 7/4/2015.
 */
public class Test {
    public static void main(final String[] args) {
        ClusteringService service = new ClusteringService();
        int[] clustering = service.doCluster();
        service.getkMeans().ShowClustered(clustering, 5, 4);

        /*MatchingService service = new MatchingService();
        OfficeDAO dao = new OfficeDAO();
        for (Office office : dao.getAllOffice()) {
            System.out.println(office.getOfficeGroupById().getOfficeGroup());
            double price;
            long p = 0;
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
                p = 0;
            } else if (price >= 100000 && price < 200000) {
                p = 1;
            } else if (price >= 200000 && price < 300000) {
                p = 2;
            } else if (price >= 300000 && price < 400000) {
                p = 3;
            } else if (price >= 400000 && price < 500000) {
                p = 4;
            } else if (price >= 500000) {
                p = 5;
            }
            int matching = service.matching(office.getLatitude(), office.getLongitude(), p);
            System.out.println(matching);
            System.out.println();
        }*/

    }
}
