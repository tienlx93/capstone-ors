package controller;

import dao.AppointmentDAO;
import entity.Account;
import entity.Appointment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            switch (button) {
                case "assign":
                    dao.update(Integer.parseInt(request.getParameter("id")), request.getParameter("assignedStaff"), 2);
                    break;
                case "reject":
                    String comment = request.getParameter("comment");
                    dao.updateComment(Integer.parseInt(request.getParameter("id")), 5, comment);
                    break;
                case "update3":
                    dao.updateStatus(Integer.parseInt(request.getParameter("id")), 3);
                    break;
            }
            response.sendRedirect("/admin/appointment");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        if (account != null && (account.getRoleId()==2 || account.getRoleId() == 3)) {
            AppointmentDAO dao = new AppointmentDAO();
            String action = request.getParameter("action");
            RequestDispatcher rd;
            if (action == null) {
                List<Appointment> list;
                if (account.getRoleId() == 2) {
                    list = dao.findAll();
                } else {
                    list = dao.getAppointmentListByStaff(account.getUsername());
                }
                request.setAttribute("data", list);
                rd = request.getRequestDispatcher("/WEB-INF/admin/appointment/viewAppointment.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")){
                request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
                request.getRequestDispatcher("/WEB-INF/admin/appointment/appointmentDetail.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/admin");
        }

    }
}
