package service;


import dao.AccountDAO;
import dao.EmailQueueDAO;
import entity.Account;
import entity.EmailQueue;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;


/**
 * Created by xps on 7/20/2015.
 */
public class ScheduleSendEmailQueue implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        String charset = "UTF-8";
        EmailQueueDAO emailQueueDAO = new EmailQueueDAO();
        int id = emailQueueDAO.getFirstEmailQueue();
        if (id != -1) {
            EmailQueue emailQueue = emailQueueDAO.get(id);
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.findByUsername(emailQueue.getUsername());

            String param1 = Integer.toString(id);
            String param2 = account.getEmail();

            URL gwtServlet = null;
            try {
                String query = String.format("id=%s&email=%s",
                        URLEncoder.encode(param1, charset),
                        URLEncoder.encode(param2, charset));

                gwtServlet = new URL("http://tienlx.me/sendMail" + "?" + query);
                HttpURLConnection servletConnection = null;

                servletConnection = (HttpURLConnection) gwtServlet.openConnection();

                servletConnection.setRequestMethod("GET");
                servletConnection.setDoOutput(true);
                InputStream response = gwtServlet.openStream();

                ObjectOutputStream objOut = new ObjectOutputStream(servletConnection.getOutputStream());
//            objOut.writeObject(p);
                objOut.flush();
                objOut.close();

            } catch (MalformedURLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }
}