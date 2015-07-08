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
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

/**
 * Created by ASUS on 6/22/2015.
 */
@WebServlet(name = "CalendarController", urlPatterns = {"/admin/calendar"})
public class CalendarController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();
        String staffName = request.getParameter("staff");
        String type = request.getParameter("type");
        Gson gson = new Gson();

        AccountDAO accountDAO = new AccountDAO();
        List<Account> staffList = accountDAO.findStaff();

        List<CalendarJSON> calendarList = new ArrayList<>();
        List<CalendarItemJSON> itemList;
        CalendarJSON calendar;
        CalendarItemJSON item;
        if (staffName!= null && !staffName.equals("")) {
            Account staff = accountDAO.get(staffName);
            calendar = new CalendarJSON(staff.getUsername());
            itemList = new ArrayList<>();

            //appointment by assigned staff
            for (Appointment appointment : staff.getAppointmentsByUsername_0()) {
                if (appointment.getStatusId() == 2) {
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
            }
            for (Rental rental : staff.getRentalsByUsername()) {
                if (rental.getStatusId() == 2 || rental.getStatusId() == 5) {
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
            }

            for (Repair repair : staff.getRepairsByUsername()) {
                if (repair.getRepairStatusId() == 2 || repair.getRepairStatusId() == 5) {
                    item = new CalendarItemJSON();
                    item.setId(repair.getId());
                    item.setStaff(staff.getUsername());
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                    item.setStart(format.format(repair.getAssignedTime() == null ? new Date() : repair.getAssignedTime()));
                    item.setTitle("Sửa chữa");
                    item.setType(2);
                    item.setUrl("/admin/repair?action=edit&id=" + repair.getId());

                    itemList.add(item);
                }
            }
            calendar.setItemList(itemList);

            calendarList.add(calendar);
        } else {
            for (Account staff : staffList) {
                calendar = new CalendarJSON(staff.getUsername());
                itemList = new ArrayList<>();

                List<String> typeList = new ArrayList<>();
                if (type!=null) {
                    StringTokenizer tokenizer = new StringTokenizer(type,",");
                    while (tokenizer.hasMoreTokens()) {
                        typeList.add(tokenizer.nextToken());
                    }
                }
                if (typeList.size()==0 || typeList.contains("appointment")) {
                    //appointment by assigned staff
                    for (Appointment appointment : staff.getAppointmentsByUsername_0()) {
                        if (appointment.getStatusId() == 2) {
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
                    }
                }
                if (typeList.size()==0 || typeList.contains("rental")) {
                    for (Rental rental : staff.getRentalsByUsername()) {
                        if (rental.getStatusId() == 2 || rental.getStatusId() == 5) {
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
                    }
                }
                if (typeList.size()==0 || typeList.contains("repair")) {
                    for (Repair repair : staff.getRepairsByUsername()) {
                        if (repair.getRepairStatusId() == 2 || repair.getRepairStatusId() == 5) {
                            item = new CalendarItemJSON();
                            item.setId(repair.getId());
                            item.setStaff(staff.getUsername());
                            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                            item.setStart(format.format(repair.getAssignedTime() == null ? new Date() : repair.getAssignedTime()));
                            item.setTitle("Sửa chữa");
                            item.setType(2);
                            item.setUrl("/admin/repair?action=edit&id=" + repair.getId());

                            itemList.add(item);
                        }
                    }
                }
                calendar.setItemList(itemList);

                calendarList.add(calendar);
            }
        }


            out.print(gson.toJson(calendarList));
        out.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        String staff = request.getParameter("staff");
        String type = request.getParameter("type");
        request.setAttribute("staff",staff);
        request.setAttribute("type",type);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/calendar/view.jsp");
        rd.forward(request, response);
    }
}
