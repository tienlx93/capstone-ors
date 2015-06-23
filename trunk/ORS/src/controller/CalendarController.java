package controller;

import com.google.gson.Gson;

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
 * Created by ASUS on 6/22/2015.
 */
@WebServlet(name = "CalendarController", urlPatterns = {"/admin/calendar"})
public class CalendarController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Gson gson = new Gson();

        //Todo: get calendar
        out.print(gson.toJson("calendar"));
        out.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/calendar/view.jsp");
        rd.forward(request, response);
    }
}
