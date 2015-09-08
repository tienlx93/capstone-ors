package controller;

import dao.AccountDAO;
import dao.RoleDAO;
import entity.Account;
import entity.Profile;
import entity.Role;
import service.ConstantService;
import dao.ProfileDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Tuan on 6/11/2015.
 */
@WebServlet(name = "UserController", urlPatterns = {"/admin/user"})
public class UserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        //String button = request.getParameter("button");
        AccountDAO dao = new AccountDAO();

        if (action.equals("save")) {
            Account acc = new Account();
            Profile profile = new Profile();
            acc.setUsername(request.getParameter("username"));
            acc.setPassword(request.getParameter("password"));
            acc.setEmail(request.getParameter("email"));
            acc.setRoleId(Integer.parseInt(request.getParameter("role")));
            acc.setStatusId(1);

            dao.save(acc);
            if (String.valueOf("role").equals("5")) {
                ProfileDAO pfDao = new ProfileDAO();
                profile.setUsername(request.getParameter("username"));
                profile.setTitle(request.getParameter("title"));
                profile.setFullName(request.getParameter("fullname"));
                profile.setCompany(request.getParameter("company"));
                profile.setPhone(request.getParameter("phone"));
                profile.setBirthday(Timestamp.valueOf(request.getParameter("date")));
                boolean result2 = pfDao.save(profile);
            }
        } else if (action.equals("delete")) {
            String username = request.getParameter("username");
            dao.delete(username);
        } else if (action.equals("ban")) {
            String username = request.getParameter("username");
            Account acc = dao.get(username);
            acc.setStatusId(2);
            dao.update(username, acc);
        } else if (action.equals("unban")) {
            String username = request.getParameter("username");
            Account acc = dao.get(username);
            acc.setStatusId(1);
            dao.update(username, acc);
        } else if (action.equals("update")) {
            String username = request.getParameter("username");
            AccountDAO accDAO = new AccountDAO();
            //Account acc = new Account();
            Account accdemo = new Account();
            accdemo.setPassword(request.getParameter("password"));
            accdemo.setEmail(request.getParameter("email"));
            accdemo.setRoleId(Integer.parseInt(request.getParameter("role")));
            accdemo.setStatusId(Integer.parseInt(request.getParameter("statusId")));

/*          String password = request.getParameter("password");
            String email = request.getParameter("email");*/
     /**//* String role = request.getParameter("role");*/
            accDAO.update(username, accdemo);
        }
        response.sendRedirect("/admin/user");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        RequestDispatcher rd;
        if (account != null && (account.getRoleId() == 1)) {
            if (action == null) {
                //view list
                int pageCount = dao.getPageCount(ConstantService.PAGE_SIZE);
                request.setAttribute("pageCount", pageCount);

                List<Account> list1 = dao.getAccountByPage(0, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list1);

                rd = request.getRequestDispatcher("/WEB-INF/admin/user/viewUser.jsp");
                rd.forward(request, response);
            } else if (action.equals("new")) {
                RoleDAO roleDAO = new RoleDAO();
                List<Role> roleList = roleDAO.findAll();
                request.setAttribute("roleList", roleList);
                rd = request.getRequestDispatcher("/WEB-INF/admin/user/addUser.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {
                String username = request.getParameter("username");
                Account acc = dao.get(username);
                request.setAttribute("account", acc);
                RoleDAO roleDAO = new RoleDAO();
                List<Role> roleList = roleDAO.findAll();
                request.setAttribute("roleList", roleList);
                rd = request.getRequestDispatcher("/WEB-INF/admin/user/editUser.jsp");
                rd.forward(request, response);
            } else if (action.equals("view")) {
                String username = request.getParameter("username");
                Account acc = dao.get(username);
                request.setAttribute("account", acc);


                rd = request.getRequestDispatcher("/WEB-INF/admin/user/editUser.jsp");
                rd.forward(request, response);


            } else if (action.equals("page")) {
                String startPage = request.getParameter("startPage");
                int page = Integer.parseInt(startPage);
                int startItem = (page - 1) * ConstantService.PAGE_SIZE;
                List<Account> list1 = dao.getAccountByPage(startItem, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list1);
                rd = request.getRequestDispatcher("/WEB-INF/partial/userListItem.jsp");
                rd.forward(request, response);
            } else if (action.equals("editing")) {
                request.setAttribute("info", dao.get(request.getParameter("username")));
                request.getRequestDispatcher("/WEB-INF/admin/user/viewUserProfile.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/admin");
        }
    }
}
