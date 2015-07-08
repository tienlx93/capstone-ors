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
            String name = request.getParameter("name");
            AmenityGroupDAO accDAO = new AmenityGroupDAO();
            AmenityGroup acc = new AmenityGroup();
            AmenityGroup accdemo = new AmenityGroup();
            accdemo.setDescription(request.getParameter("description"));
/*          String password = request.getParameter("password");
            String email = request.getParameter("email");*/
     /**//* String role = request.getParameter("role");*/
            accDAO.update(name, accdemo);
        }
        response.sendRedirect("/admin/groupAmenity");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        String action = request.getParameter("action");

        AmenityGroupDAO dao = new AmenityGroupDAO();
        List<AmenityGroup> list = dao.findAll();


        if (action == null) {
            request.setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/groupAmenity/viewGroupAmenity.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("edit")){
            String name = request.getParameter("name");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/groupAmenity/editGroupAmenity.jsp");
            rd.forward(request, response);
        }
        else if (action.equals("new")) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/groupAmenity/addGroupAmenity.jsp");
            rd.forward(request, response);
        }
        }
    }