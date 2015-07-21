package service;

import java.io.IOException;

/**
 * Created by Tuan on 7/21/2015.
 */
public class TestSMS {
    public static void main(String[] args) {
        SMSService sms = new SMSService();
        sms.setMessage("Test SMS");
        sms.setPhone("0944817762");
        try {
            sms.send();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
