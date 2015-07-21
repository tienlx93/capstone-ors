package controller;

import entity.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ASUS on 7/21/2015.
 */
@WebServlet(name = "HomeController", urlPatterns = {"/admin/home"})
public class HomeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        request.setAttribute("user", account);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/home/list.jsp");
        rd.forward(request, response);
    }
}
