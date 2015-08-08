package service;

import java.io.IOException;

/**
 * Created by ASUS on 7/17/2015.
 */
public class TestEmail {
    public static void main(String[] args) throws IOException {
        EmailService service = new EmailService();
        service.setReceiver("bestoneguy@gmail.com");
        service.setSubject("Test Email #1");
        service.setContent("Content of test email<br>Blah");
        service.sendEmail();
    }

}
