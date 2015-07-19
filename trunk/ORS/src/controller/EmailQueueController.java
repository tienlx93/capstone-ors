package controller;

import dao.AccountDAO;
import dao.EmailQueueDAO;
import entity.EmailQueue;
import service.EmailService;
import service.EmailServletResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        List<EmailQueue> emailQueueList = emailQueueDAO.findAll();

        for (EmailQueue emailQueue : emailQueueList) {
            List<String> items = Arrays.asList(emailQueue.getOfficeIds().split("\\s*,\\s*"));

            request.setAttribute("data", emailQueue);
            request.setAttribute("offices", items);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/email/emailDemo.jsp");

            EmailServletResponse res2 = new EmailServletResponse(response);
            rd.forward(request, res2);

            EmailService service = new EmailService();
            service.setReceiver("quoc0212@gmail.com");
            service.setSubject("Test Formatted Email");
            service.setContent(res2.getOutput());
            service.sendEmail();

            emailQueueDAO.remove(emailQueue);
        }
    }
}
