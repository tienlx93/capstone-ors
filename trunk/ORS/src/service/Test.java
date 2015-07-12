package service;

/**
 * Created by ASUS on 7/4/2015.
 */
public class Test {
    public static void main(final String[] args) {
        double[][] rawData = new double[20][];
        rawData[0] = new double[] { 65.0, 220.0 };
        rawData[1] = new double[] { 73.0, 160.0 };
        rawData[2] = new double[] { 59.0, 110.0 };
        rawData[3] = new double[] { 61.0, 120.0 };
        rawData[4] = new double[] { 75.0, 150.0 };
        rawData[5] = new double[] { 67.0, 240.0 };
        rawData[6] = new double[] { 68.0, 230.0 };
        rawData[7] = new double[] { 70.0, 220.0 };
        rawData[8] = new double[] { 62.0, 130.0 };
        rawData[9] = new double[] { 66.0, 210.0 };
        rawData[10] = new double[] { 77.0, 190.0 };
        rawData[11] = new double[] { 75.0, 180.0 };
        rawData[12] = new double[] { 74.0, 170.0 };
        rawData[13] = new double[] { 70.0, 210.0 };
        rawData[14] = new double[] { 61.0, 110.0 };
        rawData[15] = new double[] { 58.0, 100.0 };
        rawData[16] = new double[] { 66.0, 230.0 };
        rawData[17] = new double[] { 59.0, 120.0 };
        rawData[18] = new double[] { 68.0, 210.0 };
        rawData[19] = new double[] { 61.0, 130.0 };

        KMeans kMeans = new KMeans(rawData, 3);
        kMeans.ShowData(1, true, true);

        int numClusters = 3;
        System.out.println("\nSetting numClusters to " + numClusters);

        int[] clustering = kMeans.cluster();
        System.out.println("\nK-means clustering complete\n");

        System.out.println("Final clustering in internal form:\n");
        kMeans.ShowVector(clustering, true);

        System.out.println("Raw data by cluster:\n");
        kMeans.ShowClustered(clustering, numClusters, 1);

        System.out.println("\nEnd k-means clustering demo\n");

    }
}
