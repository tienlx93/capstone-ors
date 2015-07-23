package controller;

import com.google.gson.Gson;
import dao.OfficeDAO;
import org.joda.time.DateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by ASUS on 7/22/2015.
 */
@WebServlet(name = "IncomeStaticsController", urlPatterns = {"/admin/incomeStatics"})
public class IncomeStaticsController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();

        String year = request.getParameter("year");
        int intYear = Integer.parseInt(year);
        String district = request.getParameter("district");
        if (district == null) {
            district = "";
        }
        List<Long> result = new ArrayList<>();
        long income;
        OfficeDAO dao = new OfficeDAO();
        DateTime startDate = new DateTime(intYear, 1, 1, 0, 0); // 2015-01-01
        DateTime endDate;
        for (int i = 0; i < 12; i++) {
            startDate = startDate.withMonthOfYear(i + 1);
            endDate = startDate.plusMonths(1);
            income = dao.calculateIncome(startDate.toDate(), endDate.toDate(), district);
            result.add(income);
        }
        out.print(gson.toJson(result));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        OfficeDAO dao = new OfficeDAO();
        List<String> districts = dao.allDistrict();
        request.setAttribute("districts", districts);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/statics/income.jsp");
        rd.forward(request, response);
    }
}