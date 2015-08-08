package service;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.*;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClient;
import com.amazonaws.services.simpleemail.model.*;

import java.io.IOException;

/**
 * Created by ASUS on 7/16/2015.
 */
public class EmailService {
    public static final String CHARSET = "UTF-8";
    private static final String FROM = "no-reply@tienlx.me";
    private static final String access_key_id = "AKIAIGMXF2HQO6AULHYA",
            secret_access_key = "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";

    private String receiver;
    private String subject;
    private String content;

    public EmailService() {
    }

    public boolean sendEmail() {
        // Construct an object to contain the recipient address.
        Destination destination = new Destination().withToAddresses(this.receiver);

        // Create the subject and body of the message.
        Content subject = new Content().withData(this.subject);
        subject.setCharset(CHARSET);
        Content textBody = new Content().withData(this.content);
        textBody.setCharset(CHARSET);
        Body body = new Body().withHtml(textBody);

        // Create a message with the specified subject and body.
        Message message = new Message().withSubject(subject).withBody(body);

        // Assemble the email.
        SendEmailRequest request = new SendEmailRequest().withSource(FROM).withDestination(destination).withMessage(message);

        try {
            System.out.println("Attempting to send an email through Amazon SES by using the AWS SDK for Java...");

            AWSCredentials credentials = null;
            try {
                credentials = new ProfileCredentialsProvider().getCredentials();
            } catch (Exception e) {
                try {
                    credentials = new BasicAWSCredentials(access_key_id, secret_access_key);
                } catch (Exception e1) {
                    throw new AmazonClientException(
                            "Cannot load the credentials from the credential profiles file. " +
                                    "Please make sure that your credentials file is at the correct " +
                                    "location (~/.aws/credentials), and is in valid format.",
                            e);
                }
                /*throw new AmazonClientException(
                        "Cannot load the credentials from the credential profiles file. " +
                                "Please make sure that your credentials file is at the correct " +
                                "location (~/.aws/credentials), and is in valid format.",
                        e);*/
            }

            AmazonSimpleEmailServiceClient client = new AmazonSimpleEmailServiceClient(credentials);
            ListIdentitiesResult listIdentities = client.listIdentities();
            boolean match = false;
            for (String s : listIdentities.getIdentities()) {
                if (this.receiver.equals(s)) {
                    match = true;
                    break;
                }
            }
            if (!match) {
                VerifyEmailIdentityRequest verifyEmail = new VerifyEmailIdentityRequest();
                verifyEmail.setEmailAddress(this.receiver);
                client.verifyEmailIdentity(verifyEmail);
                return false;
            }


            Region REGION = Region.getRegion(Regions.US_EAST_1);
            client.setRegion(REGION);

            // Send the email.
            client.sendEmail(request);
            System.out.println("Email sent!");
            return true;
        } catch (Exception ex) {
            System.out.println("The email was not sent.");
            System.out.println("Error message: " + ex.getMessage());
        }

        return false;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
