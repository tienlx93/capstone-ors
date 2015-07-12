package service;

/**
 * Created by ASUS on 7/9/2015.
 */

public class MathUtil {

    public static double dot(double[] vector1, double[] vector2) {
        if (vector1.length != vector2.length) {
            throw new IllegalArgumentException("The dimensions have to be equal!");
        }

        double sum = 0;
        for (int i = 0; i < vector1.length; i++) {
            sum += vector1[i] * vector2[i];
        }

        return sum;
    }

    public static Double norm(double[] vector) {
        double meanSqrd = 0;

        for (int i = 0; i < vector.length; i++) {
            meanSqrd += vector[i] * vector[i];
        }

        return Math.sqrt(meanSqrd);
    }

    public static double[] mult(double[] vector, double scalar) {
        int length = vector.length;
        double[] result = new double[length];
        for (int i = 0; i < length; i++) {
            result[i] = vector[i] * scalar;
        }
        return result;
    }

    public static double[] add(double[] vector1, double[] vector2) {
        if (vector1.length != vector2.length) {
            throw new IllegalArgumentException("The dimensions have to be equal!");
        }

        double[] result = new double[vector1.length];
        for (int i = 0; i < vector1.length; i++) {
            result[i] = vector1[i] + vector2[i];
        }

        return result;
    }

    public static double[] subtract(double[] vector1, double[] vector2) {
        if (vector1.length != vector2.length) {
            throw new IllegalArgumentException("The dimensions have to be equal!");
        }

        double[] result = new double[vector1.length];
        for (int i = 0; i < vector1.length; i++) {
            result[i] = vector1[i] - vector2[i];
        }

        return result;
    }

    public static double euclideanDistance(double[] a, double[] b) {
        if (a.length != b.length) {
            throw new IllegalArgumentException("The dimensions have to be equal!");
        }

        double sum = 0.0;
        for (int i = 0; i < a.length; i++) {
            sum += Math.pow(a[i] - b[i], 2);
        }

        return Math.sqrt(sum);
    }

    public static double[] normalize(double[] vector) {
        double magnitude = magnitude(vector);
        return magnitude != 0 ? mult(vector, 1 / magnitude) : vector;
    }

    public static double magnitude(double[] vector) {
        double magnitude = 0.0;
        for (int i = 0; i < vector.length; i++) {
            magnitude += Math.pow(vector[i], 2);
        }

        return Math.sqrt(magnitude);
    }
}