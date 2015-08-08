package controller;

import com.amazonaws.AmazonClientException;
import dao.AccountDAO;
import dao.EmailQueueDAO;
import dao.OfficeDAO;
import entity.EmailQueue;
import entity.Office;
import service.EmailService;
import service.EmailServletResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by xps on 7/19/2015.
 */
@WebServlet(name = "EmailQueueController", urlPatterns = {"/sendMail"})
public class EmailQueueController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmailQueueDAO emailQueueDAO = new EmailQueueDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");

        EmailQueue emailQueue = emailQueueDAO.get(id);

        List<String> items = Arrays.asList(emailQueue.getOfficeIds().split("\\s*,\\s*"));
        List<Office> officeList = new ArrayList<>();
        OfficeDAO officeDAO = new OfficeDAO();

        for (String item : items) {
            Office office = officeDAO.get(Integer.parseInt(item));
            List<String> images = Arrays.asList(office.getImageUrls().split("\\s*,\\s*"));
            String image = images.get(0);
            office.setImageUrls(image);
            officeList.add(office);
        }

        request.setAttribute("data", emailQueue);
        request.setAttribute("offices", officeList);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/email/emailDemo.jsp");

        EmailServletResponse res2 = new EmailServletResponse(response);
        rd.forward(request, res2);

        EmailService service = new EmailService();
        service.setReceiver(email);
        service.setSubject("Thông báo văn phòng phù hợp");
        service.setContent(res2.getOutput());
        boolean canSend = service.sendEmail();
        if (canSend) {
            emailQueueDAO.remove(emailQueue);
            System.out.println("Remove queue");
        }
    }
}
