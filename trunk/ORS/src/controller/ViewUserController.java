package controller;

import dao.AccountDAO;
import entity.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by ASUS on 02/06/2015.
 */
@WebServlet(name = "ViewUserController",urlPatterns = {"/admin/viewUser"})
public class ViewUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        List<Account> list = dao.findAll();
        request.setAttribute("data", list);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/user/viewUser.jsp");
        rd.forward(request, response);
    }
}
