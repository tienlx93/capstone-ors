package service;

/**
 * Created by ASUS on 7/10/2015.
 */
public class Array {

    public static void Copy(int[] clustering, int[] newClustering, int length) {
        for (int i = 0; i < length; i++) {
            newClustering[i] = clustering[i];
        }
    }

    public static void Copy(double[] array, double[] newArray, int length) {
        for (int i = 0; i < length; i++) {
            newArray[i] = array[i];
        }
    }
}
