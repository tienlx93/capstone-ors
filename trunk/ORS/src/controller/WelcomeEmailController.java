package controller;

import dao.AccountDAO;
import entity.Account;
import org.joda.time.Duration;
import service.EmailService;
import service.EmailServletResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by xps on 8/20/2015.
 */
@WebServlet(name = "WelcomeEmailController", urlPatterns = {"/welcome"})
public class WelcomeEmailController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        AccountDAO dao = new AccountDAO();
        Account account = dao.get(username);
        String email = account.getEmail();
        String fullName = account.getProfileByUsername().getFullName();

        request.setAttribute("fullName", fullName);
        request.setAttribute("username", username);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/email/welcome.jsp");
        EmailServletResponse res2 = new EmailServletResponse(response);
        rd.forward(request, res2);

        EmailService service = new EmailService();
        service.setReceiver(email);
        service.setSubject("Office Rental Service");
        service.setContent(res2.getOutput());
        boolean canSend = false;

        canSend = service.sendEmail();
        if (canSend) {
            account.setStatusId(1);
            dao.update(username, account);
        }
        response.getWriter().print("Send success");

    }
}
