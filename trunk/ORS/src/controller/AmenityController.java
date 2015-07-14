package controller;

import com.google.gson.Gson;
import dao.AmenityDAO;
import dao.AccountDAO;
import dao.AmenityGroupDAO;
import dao.RoleDAO;
import entity.Account;
import entity.Amenity;
import entity.AmenityGroup;
import entity.Role;
import json.AccountJSON;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ASUS on 6/8/2015.
 */
@WebServlet(name = "AmenityController", urlPatterns = "/admin/amenity")
public class AmenityController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AmenityDAO dao = new AmenityDAO();
        if (action.equals("save")) {
            Amenity ame = new Amenity();
            ame.setName(request.getParameter("name"));
            ame.setDescription(request.getParameter("description"));
            ame.setWeight(Integer.parseInt(request.getParameter("weight")));
            ame.setWeight(Integer.parseInt(request.getParameter("priority")));
            ame.setAmenityGroupId(Integer.parseInt(request.getParameter("group")));
            dao.save(ame);
        } else if (action.equals("delete")) {
            String name = request.getParameter("name");
        } else if (action.equals("update")) {
            String name = request.getParameter("name");
            AmenityDAO accDAO = new AmenityDAO();
            Amenity ame = new Amenity();
            Amenity amedemo = new Amenity();
            amedemo.setWeight(Integer.parseInt(request.getParameter("weight")));
            amedemo.setWeight(Integer.parseInt(request.getParameter("priority")));
            amedemo.setDescription(request.getParameter("description"));

/*          String password = request.getParameter("password");
            String email = request.getParameter("email");*/
     /**//* String role = request.getParameter("role");*/

            accDAO.update(name, amedemo);
        }
        response.sendRedirect("/admin/amenity");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        String action = request.getParameter("action");

        AmenityDAO dao = new AmenityDAO();

        List<Amenity> list =  dao.findAll();
        if (action == null) {
            request.setAttribute("data", list);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/amenity/viewAmenity.jsp");
            rd.forward(request, response);
        } else if (action.equals("new")) {
            AmenityGroupDAO groupDAO = new AmenityGroupDAO();
           List<AmenityGroup> groupList = groupDAO.findAll();
            request.setAttribute("groupList", groupList);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/amenity/addAmenity.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")) {
            //String name = request.getParameter("name");
            //Amenity amenity = dao.get(Integer.valueOf(name));
            //request.setAttribute("amenity", amenity);
            int id = Integer.parseInt(request.getParameter("id"));
            Amenity amenity = dao.get(id);
            request.setAttribute("amenity", amenity);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/amenity/editAmenity.jsp");
            rd.forward(request, response);
        }
    }
}
