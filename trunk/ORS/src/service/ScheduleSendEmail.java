package service;


import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;


/**
 * Created by xps on 7/20/2015.
 */
public class ScheduleSendEmail implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        URL gwtServlet = null;
        try {
            gwtServlet = new URL("http://localhost:8080/sendEmail");
            HttpURLConnection servletConnection = (HttpURLConnection) gwtServlet.openConnection();
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