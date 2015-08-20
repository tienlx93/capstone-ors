package service;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by ASUS on 7/18/2015.
 */
public class ConstantService {
    public static final int PAGE_SIZE = 10;
    private Properties properties;

    public ConstantService() {
        properties = new Properties();
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        try {
            properties.load(classLoader.getResourceAsStream("constant.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String readProperty(String key) {
        if (properties!= null) {
            return properties.getProperty(key, "error");
        } else {
            return "error";
        }
    }
}
