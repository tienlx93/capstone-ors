package controller;

import dao.AccountDAO;
import dao.BaseDAO;
import dao.RoleDAO;
import entity.Account;
import entity.Role;
import service.EmailService;
import service.EmailServletResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by ASUS on 5/28/2015.
 */
@WebServlet(name = "DemoMailController", urlPatterns = {"/mail"})
public class DemoMailController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        request.setAttribute("data", "This is dynamic content");
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/email/emailDemo.jsp");

        EmailServletResponse res2 = new EmailServletResponse(response);
        rd.forward(request, res2);

        EmailService service = new EmailService();
        service.setReceiver("tienle_dl@yahoo.com");
        service.setSubject("Test Formatted Email");
        service.setContent(res2.getOutput());
        service.sendEmail();
    }
}
