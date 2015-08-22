package service;

import dao.AccountDAO;
import entity.Account;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

/**
 * Created by ASUS on 8/21/2015.
 */
public class ScheduleSendWelcomeEmail implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        String charset = "UTF-8";
        URL gwtServlet = null;
        AccountDAO dao = new AccountDAO();
        List<Account> notAccountList = dao.getNotAccountList();
        if (notAccountList.size() > 0) {
            Account account = notAccountList.get(0);
            try {
                ConstantService constantService = new ConstantService();
                String host = constantService.readProperty("host");
                String query = String.format("username=%s",
                        URLEncoder.encode(account.getUsername(), charset));
                System.out.println("Send welcome email for " + account.getUsername());
                gwtServlet = new URL(host + "/welcome" + "?" + query);
                HttpURLConnection servletConnection = (HttpURLConnection) gwtServlet.openConnection();
                servletConnection.setRequestMethod("GET");
                servletConnection.setDoOutput(true);
                InputStream response = gwtServlet.openStream();

                ObjectOutputStream objOut = new ObjectOutputStream(servletConnection.getOutputStream());
                objOut.flush();
                objOut.close();

            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }
}
