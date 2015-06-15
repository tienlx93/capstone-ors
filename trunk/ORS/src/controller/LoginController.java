package controller;

import dao.AccountDAO;
import entity.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Tuan on 6/13/2015.
 */
@WebServlet(name = "LoginController", urlPatterns = {"/admin"})
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AccountDAO dao = new AccountDAO();
        if (action.equals("login")) {
            AccountDAO accDAO = new AccountDAO();
            Account acc = new Account();
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
//            acc.setUsername(request.getParameter("username"));
//            acc.setPassword(request.getParameter("password"));
            acc = accDAO.login(username, password);
            if (acc!=null && acc.getRoleId() != 4) {
                HttpSession session = request.getSession();
                session.setAttribute("user", acc);
                response.sendRedirect("/admin/office");
            } else {
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                request.setAttribute("error", "Thông tin đăng nhập không chính xác");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/adminLogin.jsp");
                rd.forward(request, response);
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        String action = request.getParameter("action");
        if (action == null) {
            //view list
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/adminLogin.jsp");
            rd.forward(request, response);
        }

    }

}
