package controller;

import com.google.gson.Gson;
import dao.AccountDAO;
import dao.OfficeDAO;
import entity.Office;
import json.OfficeJSON;
import json.OfficeListDetail;

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
 * Created by ASUS on 6/9/2015.
 */
@WebServlet(name = "ApiController", urlPatterns = "/api")
public class ApiController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Gson gson = new Gson();

        String action = request.getParameter("action");
        if (action.equals("getOffice")) {
            String officeId = request.getParameter("officeId");
            if (officeId != null) {
                int id = Integer.parseInt(officeId);
                Office office;
                OfficeDAO dao = new OfficeDAO();
                office = dao.get(id);
                OfficeJSON json = new OfficeJSON(office);
                out.print(gson.toJson(json));

            } else {
                out.print(gson.toJson("Missing officeId"));
            }
        } else if (action.equals("getAllOffice")) {
            List<OfficeListDetail> officeList = new ArrayList<>();
            OfficeDAO dao = new OfficeDAO();
            for (Office office : dao.findAll()) {
                officeList.add(new OfficeListDetail(office));
            }

            out.print(gson.toJson(officeList));

        } else if (action.equals("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username != null && password != null) {

                AccountDAO dao = new AccountDAO();
                if (dao.isValid(username, password)) {
                    out.print(gson.toJson("Success"));
                } else {
                    out.print(gson.toJson("Error"));
                }
            } else {
                out.print(gson.toJson("Error"));
            }
        }

        out.flush();
    }
}
