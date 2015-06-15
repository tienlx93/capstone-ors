package controller;

import dao.AppointmentDAO;
import entity.Appointment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by xps on 6/11/2015.
 */
@WebServlet(name = "AppointmentController", urlPatterns = {"/admin/appointment"})
public class AppointmentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String button = request.getParameter("button");
        AppointmentDAO dao = new AppointmentDAO();
        if (action.equals("editing")) {
            if(button.equals("assign")) {
                dao.update(Integer.parseInt(request.getParameter("id")),request.getParameter("assignedStaff"),Timestamp.valueOf(request.getParameter("time")),2);
            } else if (button.equals("reject")) {
                dao.updateStatus(Integer.parseInt(request.getParameter("id")), 5);
            }
            response.sendRedirect("/admin/appointment");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AppointmentDAO dao = new AppointmentDAO();
        String action = request.getParameter("action");
        RequestDispatcher rd;
        if (action == null) {
            List<Appointment> list = dao.findAll();
            request.setAttribute("data", list);
            rd = request.getRequestDispatcher("/WEB-INF/admin/appointment/viewAppointment.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")){
            request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
            request.getRequestDispatcher("/WEB-INF/admin/appointment/appointmentDetail.jsp").forward(request, response);
//
        }
    }
}
