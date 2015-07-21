package controller;

import com.google.gson.Gson;
import entity.Account;
import json.StaffStaticDetail;
import json.StaffStaticsJSON;
import org.joda.time.DateTime;
import org.joda.time.Weeks;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import service.ScheduleService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ASUS on 7/19/2015.
 */
@WebServlet(name = "StaffStaticsController", urlPatterns = "/admin/staffStatics")
public class StaffStaticsController extends HttpServlet {
    private Gson gson;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        gson = new Gson();

        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        Date startDate = new Timestamp(Long.parseLong(startDateStr));
        Date endDate = new Timestamp(Long.parseLong(endDateStr));

        DateTime start = new DateTime(startDate);
        DateTime end = new DateTime(endDate);

        int weeks = Weeks.weeksBetween(start, end).getWeeks();
        ScheduleService service = new ScheduleService();
        List<Account> staffList = service.getStaffList();
        List<String> accounts = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormat.forPattern("dd-MM");
        StaffStaticsJSON json = new StaffStaticsJSON(weeks);
        List<String> dates = json.getDates();
        List<StaffStaticDetail> map = json.getMap();

        for (Account account : staffList) {
            accounts.add(account.getUsername());
            map.add(new StaffStaticDetail(account.getUsername()));
        }

        for (int i = 0; i < weeks; i++) {
            DateTime current = start.plusDays(i * 7);
            DateTime weekEnd = current.plusDays(7);
            Map<String, Integer> jobCount = service.getWeekJobCount(current.toDate(), weekEnd.toDate());
            dates.add(formatter.print(current));
            for (int j = 0; j < accounts.size(); j++) {
                String account = accounts.get(j);
                map.get(j).getData().add(jobCount.get(account));
            }
        }

        out.print(gson.toJson(json));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/statics/staff.jsp");
        rd.forward(request, response);
    }
}
