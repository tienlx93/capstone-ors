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
@WebServlet(name = "AddUserController",urlPatterns = {"/addUser"})
public class AddUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AccountDAO dao = new AccountDAO();
        if (action.equals("Save")) {
            Account acc = new Account();
            acc.setUsername(request.getParameter("username"));
            acc.setPassword(request.getParameter("password"));
            acc.setEmail(request.getParameter("email"));
            acc.setRoleId(4);
            dao.save(acc);
        }
        /*Role role = new Role();
        role.setRoleName("New ROle");
        RoleDAO dao2 = new RoleDAO();
        dao2.save(role);*/
        response.sendRedirect("/addUser");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        List<Account> list = dao.findAll();
        request.setAttribute("data", list);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/addUser.jsp");
        rd.forward(request, response);
    }
}
