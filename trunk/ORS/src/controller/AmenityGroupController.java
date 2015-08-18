package controller;

import dao.AccountDAO;
import dao.AmenityDAO;
import dao.AmenityGroupDAO;
import entity.Account;
import entity.Amenity;
import entity.AmenityGroup;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tuan on 6/29/2015.
 */
@WebServlet(name = "AmenityGroupController", urlPatterns = "/admin/groupAmenity")
public class AmenityGroupController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AmenityGroupDAO dao = new AmenityGroupDAO();
        if (action.equals("save")) {
            AmenityGroup ag = new AmenityGroup();
            ag.setName(request.getParameter("name"));
            ag.setDescription(request.getParameter("description"));
            dao.save(ag);
        } else if (action.equals("delete")) {
            String username = request.getParameter("name");
          //  dao.delete(name);
    } else if (action.equals("update")) {
            AmenityGroupDAO accDAO = new AmenityGroupDAO();
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            accDAO.updateN(id,name,description);
        }
        response.sendRedirect("/admin/groupAmenity");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        String action = request.getParameter("action");

        AmenityGroupDAO dao = new AmenityGroupDAO();
        List<AmenityGroup> list = dao.findAll();

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        if (account != null && (account.getRoleId() == 2)) {
            if (action == null) {
                request.setAttribute("list", list);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/groupAmenity/viewGroupAmenity.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                AmenityGroup amenitygroup = dao.get(id);
                request.setAttribute("amenitygroup", amenitygroup);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/groupAmenity/editGroupAmenity.jsp");
                rd.forward(request, response);
            } else if (action.equals("new")) {
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/groupAmenity/addGroupAmenity.jsp");
                rd.forward(request, response);
            }
        }else {
            response.sendRedirect("/admin");
        }
    }
    }
