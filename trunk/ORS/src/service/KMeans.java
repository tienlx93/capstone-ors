package service;

import java.util.Random;


/**
 * Inspired from
 * http://www.cs.princeton.edu/courses/archive/fall08/cos436/Duda/C/sk_means.htm
 *
 * @author pmerienne
 */
public class KMeans {
    private double[][] rawData;
    private double[][] data;
    private double[] maxs;
    private double[] mins;
    //k number
    private int numClusters;

    /**
     * Init the KMeans
     *
     * @param rawData     Array of data
     * @param numClusters Number k: number of clusters to be divided
     */
    public KMeans(double[][] rawData, int numClusters) {
        this.rawData = rawData;
        this.data = normalized();
        this.numClusters = numClusters;
    }

    /**
     * k-maxs clustering
     *
     * @return index of return is tuple ID, cell is cluster ID
     * ex: [2 1 0 0 2 2] maxs tuple 0 is cluster 2, tuple 1 is cluster 1, tuple 2 is cluster 0, tuple 3 is cluster 0, etc.
     * an alternative clustering DS to save space is to use the .NET BitArray class
     */
    public int[] cluster() {
        boolean changed = true; // was there a change in at least one cluster assignment?
        boolean success = true; // were all maxs able to be computed? (no zero-count clusters)

        // init clustering[] to get things started
        // an alternative is to initialize maxs to randomly selected tuples
        // then the processing loop is
        // loop
        //    update clustering
        //    update maxs
        // end loop
        int[] clustering = initClustering(data.length, numClusters, 0); // semi-random initialization
        double[][] means = allocate(numClusters, data[0].length); // small convenience

        int maxCount = data.length * 10; // sanity check
        int ct = 0;
        while (changed && success && ct < maxCount) {
            ++ct; // k-maxs typically converges very quickly
            success = updateMeans(clustering, means); // compute new cluster maxs if possible. no effect if fail
            changed = updateClustering(clustering, means); // (re)assign tuples to clusters. no effect if fail
        }
        return clustering;
    }

    /**
     * normalize raw data by computing min-max:
     * v' = (v - min) / (max - min)
     *
     * @return array of normalize (0:1) numbers
     */
    private double[][] normalized() {
        // make a copy of input data
        double[][] result = new double[rawData.length][];
        for (int i = 0; i < rawData.length; ++i) {
            result[i] = new double[rawData[i].length];
            System.arraycopy(rawData[i], 0, result[i], 0, rawData[i].length);
        }

        maxs = new double[result[0].length];
        mins = new double[result[0].length];

        for (int j = 0; j < result[0].length; ++j) // each col
        {
            double min = Double.MAX_VALUE;
            double max = Double.MIN_VALUE;
            for (double[] aResult : result) {
                if (min > aResult[j]) {
                    min = aResult[j];
                }
                if (max < aResult[j]) {
                    max = aResult[j];
                }
            }
            maxs[j] = max;
            mins[j] = min;
            for (int i = 0; i < result.length; ++i)
                result[i][j] = (result[i][j] - min) / (max - min);
        }
        return result;
    }

    /**
     * init clustering semi-randomly (at least one tuple in each cluster)
     * consider alternatives, especially k-maxs++ initialization,
     * or instead of randomly assigning each tuple to a cluster, pick
     * numClusters of the tuples as initial centroids/maxs then use
     * those maxs to assign each tuple to an initial cluster.
     *
     * @param numTuples   Number of tupples
     * @param numClusters number of clusters
     * @param randomSeed
     * @return
     */
    private int[] initClustering(int numTuples, int numClusters, int randomSeed) {
        Random random = new Random(randomSeed);
        int[] clustering = new int[numTuples];
        for (int i = 0; i < numClusters; ++i) // make sure each cluster has at least one tuple
            clustering[i] = i;
        for (int i = numClusters; i < clustering.length; ++i)
            clustering[i] = random.nextInt(numClusters); // other assignments random
        return clustering;
    }

    /**
     * convenience matrix allocator for cluster()
     *
     * @param numClusters
     * @param numColumns
     * @return
     */
    private double[][] allocate(int numClusters, int numColumns) {
        double[][] result = new double[numClusters][];
        for (int k = 0; k < numClusters; ++k)
            result[k] = new double[numColumns];
        return result;
    }

    /**
     * check existing cluster counts
     * can omit this check if initClustering and updateClustering
     * both guarantee at least one tuple in each cluster (usually true)
     *
     * @param clustering
     * @param means      parameter maxs[][] is really a ref parameter
     * @return returns false if there is a cluster that has no tuples assigned to it
     */
    private boolean updateMeans(int[] clustering, double[][] means) {
        int numClusters = means.length;
        int[] clusterCounts = new int[numClusters];
        for (int i = 0; i < data.length; ++i) {
            int cluster = clustering[i];
            ++clusterCounts[cluster];
        }

        for (int k = 0; k < numClusters; ++k)
            if (clusterCounts[k] == 0)
                return false; // bad clustering. no change to maxs[][]

        // update, zero-out maxs so it can be used as scratch matrix
        for (int k = 0; k < means.length; ++k)
            for (int j = 0; j < means[k].length; ++j)
                means[k][j] = 0.0;

        for (int i = 0; i < data.length; ++i) {
            int cluster = clustering[i];
            for (int j = 0; j < data[i].length; ++j)
                means[cluster][j] += data[i][j]; // accumulate sum
        }

        for (int k = 0; k < means.length; ++k)
            for (int j = 0; j < means[k].length; ++j)
                means[k][j] /= clusterCounts[k]; // danger of div by 0
        return true;
    }

    /**
     * (re)assign each tuple to a cluster (closest mean)
     * returns false if no tuple assignments change OR
     * if the reassignment would result in a clustering where
     * one or more clusters have no tuples.
     *
     * @param clustering
     * @param means
     * @return
     */
    private boolean updateClustering(int[] clustering, double[][] means) {

        int numClusters = means.length;
        boolean changed = false;

        int[] newClustering = new int[clustering.length]; // proposed result
        System.arraycopy(clustering, 0, newClustering, 0, newClustering.length);

        double[] distances = new double[numClusters]; // distances from curr tuple to each mean

        for (int i = 0; i < data.length; ++i) // walk thru each tuple
        {
            for (int k = 0; k < numClusters; ++k)
                distances[k] = MathUtil.euclideanDistance(data[i], means[k]); // compute distances from curr tuple to all k maxs

            int newClusterID = minIndex(distances); // find closest mean ID
            if (newClusterID != newClustering[i]) {
                changed = true;
                newClustering[i] = newClusterID; // update
            }
        }

        if (!changed)
            return false; // no change so bail and don't update clustering[][]

        // check proposed clustering[] cluster counts
        int[] clusterCounts = new int[numClusters];
        for (int i = 0; i < data.length; ++i) {
            int cluster = newClustering[i];
            ++clusterCounts[cluster];
        }

        for (int k = 0; k < numClusters; ++k)
            if (clusterCounts[k] == 0)
                return false; // bad clustering. no change to clustering[][]

        System.arraycopy(newClustering, 0, clustering, 0, newClustering.length);
        return true; // good clustering and at least one change
    }

    /**
     * index of smallest value in array
     * helper for updateClustering()
     *
     * @param distances
     * @return
     */
    private int minIndex(double[] distances) {
        int indexOfMin = 0;
        double smallDist = distances[0];
        for (int k = 0; k < distances.length; ++k) {
            if (distances[k] < smallDist) {
                smallDist = distances[k];
                indexOfMin = k;
            }
        }
        return indexOfMin;
    }

    // ============================================================================

    // misc display helpers for demo

    void ShowData(int decimals, boolean indices, boolean newLine) {
        for (int i = 0; i < rawData.length; ++i) {
            if (indices) System.out.print(i + " ");
            for (int j = 0; j < rawData[i].length; ++j) {
                if (rawData[i][j] >= 0.0) System.out.print(" ");
                System.out.print(rawData[i][j] + " ");
            }
            System.out.println("");
        }
        if (newLine) System.out.println("");
    } // ShowData

    void ShowVector(int[] vector, boolean newLine) {
        for (int i = 0; i < vector.length; ++i)
            System.out.print(vector[i] + " ");
        if (newLine) System.out.println("\n");
    }

    void ShowClustered(int[] clustering, int numClusters, int decimals) {
        for (int k = 0; k < numClusters; ++k) {
            System.out.println("===================");
            for (int i = 0; i < rawData.length; ++i) {
                int clusterID = clustering[i];
                if (clusterID != k) continue;
                System.out.print(i + " ");
                for (int j = 0; j < rawData[i].length; ++j) {
                    if (data[i][j] >= 0.0) System.out.print(" ");
                    System.out.print(data[i][j] + " ");
                }
                System.out.println("");
            }
            System.out.println("===================");
        } // k
    }

    public double[][] getData() {
        return data;
    }

    public double[] getMaxs() {
        return maxs;
    }

    public double[] getMins() {
        return mins;
    }
}