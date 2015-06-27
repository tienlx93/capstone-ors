package controller;

import com.google.gson.Gson;
import dao.AccountDAO;
import entity.Account;
import entity.Appointment;
import entity.Rental;
import entity.Repair;
import json.CalendarItemJSON;
import json.CalendarJSON;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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

        AccountDAO accountDAO = new AccountDAO();
        List<Account> staffList = accountDAO.findStaff();

        List<CalendarJSON> calendarList = new ArrayList<>();
        List<CalendarItemJSON> itemList;
        CalendarJSON calendar;
        CalendarItemJSON item;
        for (Account staff : staffList) {
            calendar = new CalendarJSON(staff.getUsername());
            itemList = new ArrayList<>();

            //appointment by assigned staff
            for (Appointment appointment : staff.getAppointmentsByUsername_0()) {
                item = new CalendarItemJSON();
                item.setId(appointment.getId());
                item.setStaff(staff.getUsername());
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                item.setStart(format.format(appointment.getTime()));
                item.setTitle("Xem văn phòng");
                item.setType(1);
                item.setUrl("/admin/appointment?action=edit&id=" + appointment.getId());

                itemList.add(item);
            }
            for (Rental rental : staff.getRentalsByUsername()) {
                item = new CalendarItemJSON();
                item.setId(rental.getId());
                item.setStaff(staff.getUsername());
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                item.setStart(format.format(rental.getAssignedTime()));
                item.setTitle("Thuê thiết bị");
                item.setType(3);
                item.setUrl("/admin/rental?action=edit&id=" + rental.getId());

                itemList.add(item);
            }

            for (Repair repair : staff.getRepairsByUsername()) {
                item = new CalendarItemJSON();
                item.setId(repair.getId());
                item.setStaff(staff.getUsername());
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                item.setStart(format.format(repair.getAssignedTime()));
                item.setTitle("Sửa chữa");
                item.setType(2);
                item.setUrl("/admin/rental?action=edit&id=" + repair.getId());

                itemList.add(item);
            }
            calendar.setItemList(itemList);

            calendarList.add(calendar);
        }

        out.print(gson.toJson(calendarList));
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
