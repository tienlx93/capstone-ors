package controller;

import com.google.gson.Gson;
import dao.AmenityDAO;
import dao.AccountDAO;
import entity.Account;
import entity.Amenity;
import json.AccountJSON;

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
@WebServlet(name = "AmenityController", urlPatterns = "/api/amenity")
public class AmenityController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Gson gson = new Gson();

        AmenityDAO dao = new AmenityDAO();

        List<String> list = new ArrayList<>();
        for (Amenity amenity : dao.findAll()) {
            list.add(amenity.getName());
        }
        out.print(gson.toJson(list));
        out.flush();
    }
}
