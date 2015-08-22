package controller;

import dao.AccountDAO;
import dao.AppointmentDAO;
import entity.Account;
import entity.Appointment;
import service.SMSService;
import service.ScheduleService;
import util.AccentRemover;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * Created by xps on 6/11/2015.
 */
@WebServlet(name = "AppointmentController", urlPatterns = {"/admin/appointment"})
public class AppointmentController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String button = request.getParameter("button");
        String id = request.getParameter("id");
        AppointmentDAO dao = new AppointmentDAO();
        Appointment appointment = dao.get(Integer.valueOf(id));
        SMSService sms = new SMSService();
        String phone = appointment.getAccountByCustomerUsername().getProfileByUsername().getPhone();
        sms.setPhone(phone);
        String comment = null;
        if (action.equals("editing")) {
            switch (button) {
                case "assign":
                    dao.update(Integer.parseInt(request.getParameter("id")), request.getParameter("assignedStaff"),
                            appointment.getTime(), 2);
                    DateFormat df = new SimpleDateFormat("dd-MM-yyyy - hh:mm");
                    sms.setMessage("(ORS) Lich hen cua Quy khach da duoc chap nhan. Hen Quy khach vao thoi gian: "
                            + df.format(appointment.getTime()));
                    try {
                        sms.send();
                    } catch (IOException e) {
                        System.out.println("Fail to send sms");
                    }
                    break;
                case "reject":
                    comment = request.getParameter("comment");
                    if (comment!= null) {
                        dao.updateComment(Integer.parseInt(request.getParameter("id")), 5, "");
                        String nonUTF8Comment = AccentRemover.removeAccent(comment);
                        sms.setMessage("(ORS) Lich hen cua Quy khach khong duoc chap nhan. Ly do: " + nonUTF8Comment);
                        try {
                            sms.send();
                        } catch (IOException e) {
                            System.out.println("Fail to send sms");
                        }
                    } 
                    break;
                case "reject2":
                    comment = request.getParameter("comment");
                    if (comment!= null) {
                        dao.updateComment(Integer.parseInt(request.getParameter("id")), 5, comment);
                    }
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
        if (account != null && (account.getRoleId() == 2 || account.getRoleId() == 3)) {
            AppointmentDAO dao = new AppointmentDAO();
            String action = request.getParameter("action");
            RequestDispatcher rd;
            if (action == null) {
                ScheduleService service = new ScheduleService();
                Map<Integer, String> suggestMap = service.makeAppointmentSchedule();
                request.setAttribute("suggestMap", suggestMap);
                List<Appointment> list;
                if (account.getRoleId() == 2) {
                    list = dao.findAll();
                } else {
                    list = dao.getAppointmentListByStaffAndOffice(account.getUsername(), "");
                }
                request.setAttribute("data", list);
                rd = request.getRequestDispatcher("/WEB-INF/admin/appointment/viewAppointment.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {
                Appointment appointment = dao.get(Integer.parseInt(request.getParameter("id")));
                String linkBack = request.getParameter("linkBack");
                String urlBack = "";
                if (linkBack != null) {
                    urlBack = "/admin/" + linkBack;
                } else {
                    switch (appointment.getStatusId()) {
                        case 1:
                            urlBack = "/admin/appointment";
                            break;
                        case 2:
                            urlBack = "/admin/appointment#assigned";
                            break;
                        case 3:
                            urlBack = "/admin/appointment#accepted";
                            break;
                        case 4:
                            urlBack = "/admin/appointment#done";
                            break;
                        case 5:
                            urlBack = "/admin/appointment#cancel";
                            break;
                    }
                }
                request.setAttribute("urlBack", urlBack);
                request.setAttribute("info", appointment);
                request.getRequestDispatcher("/WEB-INF/admin/appointment/appointmentDetail.jsp").forward(request, response);
            } else if (action.equals("filter")) {
                String office = new String(request.getParameter("office").getBytes(
                        "iso-8859-1"), "UTF-8");
                String staff = request.getParameter("staff");
                if (staff == null) {
                    staff = "";
                }
                List<Appointment> list;
                if (account.getRoleId() == 2) {
                    list = dao.getAppointmentListByStaffAndOffice(staff, office);
                } else {
                    list = dao.getAppointmentListByStaffAndOffice(account.getUsername(), office);
                }
                request.setAttribute("office", office);
                request.setAttribute("staff", staff);
                request.setAttribute("data", list);
                rd = request.getRequestDispatcher("/WEB-INF/admin/appointment/viewAppointment.jsp");
                rd.forward(request, response);
            } else if (action.equals("viewProfile")) {
                AccountDAO daoAcc = new AccountDAO();
                request.setAttribute("info", daoAcc.get(request.getParameter("username")));
                request.getRequestDispatcher("/WEB-INF/admin/contract/userProfileByContract.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/admin");
        }

    }
}
