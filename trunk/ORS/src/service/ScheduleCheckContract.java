package service;

import dao.ContractDAO;
import dao.EmailQueueDAO;
import entity.Contract;
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
import java.util.Date;
import java.util.List;

/**
 * Created by xps on 7/17/2015.
 */
public class ScheduleCheckContract implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        ContractDAO dao = new ContractDAO();
        List<Contract> contractList = dao.getContractListAvailable();

        Date date = new Date();

        for (Contract contract : contractList) {
            long currentDate = date.getTime();
            long endDate = contract.getEndDate().getTime();

            long dayTime = (endDate - currentDate) / (24 * 60 * 60 * 1000);

            if (currentDate - endDate > 0){
                if(contract.getStatusId() == 1) {
                    dao.changeStatus(contract.getId(), 4);
                    sendEmail(contract.getId(), contract.getStatusId());
                }
            } else if (dayTime == 7) {
//                System.out.println(contract.getId());
                sendEmail(contract.getId(), contract.getStatusId());
            }
        }

    }

    private void sendEmail(int id, int status) {
        String charset = "UTF-8";
        String param1 = Integer.toString(id);
        String param2 = Integer.toString(status);

        URL gwtServlet = null;
        try {
            String query = String.format("id=%s&status=%s",
                    URLEncoder.encode(param1, charset),
                    URLEncoder.encode(param2, charset));

            gwtServlet = new URL("http://localhost:8080/contractMail" + "?" + query);
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

