package controller;

import dao.AccountDAO;
import dao.RoleDAO;
import entity.Account;
import entity.Role;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Tuan on 6/11/2015.
 */
@WebServlet(name = "UserController", urlPatterns = {"/admin/user"})
public class UserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AccountDAO dao = new AccountDAO();
        if (action.equals("save")) {
            Account acc = new Account();
            acc.setUsername(request.getParameter("username"));
            acc.setPassword(request.getParameter("password"));
            acc.setEmail(request.getParameter("email"));
            acc.setRoleId(Integer.parseInt(request.getParameter("role")));
            acc.setStatusId(1);
            dao.save(acc);
        } else if (action.equals("delete")) {
            String username = request.getParameter("username");
            dao.delete(username);
        } else if (action.equals("ban")) {
            String username = request.getParameter("username");
            Account acc = dao.get(username);
            if (acc.getStatusId()==1)
            {
                acc.setStatusId(2);
            }
            else
            {
                acc.setStatusId(1);
            }
            dao.update(username,acc);
//        } else if (action.equals("unban")) {
//            String username = request.getParameter("username");
//            Account acc = dao.get(username);
//            acc.setStatusId(1);
//            dao.update(username, acc);
        } else if (action.equals("update")) {
            String username = request.getParameter("username");

        }
        response.sendRedirect("/admin/user");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        String action = request.getParameter("action");

        if (action==null){
            //view list
            List<Account> list = dao.getAccountList();
            request.setAttribute("data", list);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/user/viewUser.jsp");
            rd.forward(request, response);
        } else if (action.equals("new")){
            RoleDAO roleDAO = new RoleDAO();
            List<Role> roleList = roleDAO.findAll();
            request.setAttribute("roleList", roleList);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/user/addUser.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")){
            String username = request.getParameter("username");
            Account acc = dao.get(username);
            request.setAttribute("account", acc);
            RoleDAO roleDAO = new RoleDAO();
            List<Role> roleList = roleDAO.findAll();
            request.setAttribute("roleList", roleList);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/user/editUser.jsp");
            rd.forward(request, response);
        }
    }
}
