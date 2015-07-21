package controller;

import dao.AppointmentDAO;
import entity.Account;
import entity.Appointment;
import entity.Office;
import service.ConstantService;
import service.SMSService;
import service.ScheduleService;

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
import java.util.Date;
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
        String phone = appointment.getAccountByCustomerUsername().getProfileByUsername().getPhone();
        SMSService sms = new SMSService();
        sms.setPhone(phone);
        if (action.equals("editing")) {
            switch (button) {
                case "assign":
                    dao.update(Integer.parseInt(request.getParameter("id")), request.getParameter("assignedStaff"),
                            appointment.getTime(), 2);
                    DateFormat df = new SimpleDateFormat("dd-MM-yyyy - hh:mm");
                    sms.setMessage("Lich hen cua ban da duoc chap nhan. Hen ban vao thoi gian: "
                            + df.format(appointment.getTime()));
                    sms.send();
                    break;
                case "reject":
                    String comment = request.getParameter("comment");
                    dao.updateComment(Integer.parseInt(request.getParameter("id")), 5, comment);
                    sms.setMessage("Lich hen cua ban khong duoc chap nhan. Ly do: " + comment);
                    sms.send();
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
                int pageCount = dao.getPageCount(ConstantService.PAGE_SIZE);
                request.setAttribute("pageCount", pageCount);

                List<Appointment> list = dao.getAppointmentByPage(0, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list);
                //List<Appointment> list;
                if (account.getRoleId() == 2) {
                    list = dao.findAll();
                    ScheduleService service = new ScheduleService();
                    Map<Integer, String> suggestMap = service.makeAppointmentSchedule();
                    request.setAttribute("suggestMap", suggestMap);
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
            else if (action.equals("page")) {
                String startPage = request.getParameter("startPage");
                int page = Integer.parseInt(startPage);
                int startItem = (page - 1) * ConstantService.PAGE_SIZE;
                List<Appointment> list = dao.getAppointmentByPage(startItem, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list);
                rd = request.getRequestDispatcher("/WEB-INF/partial/appointmentListItem.jsp");
                rd.forward(request, response);
            }
        } else {
            response.sendRedirect("/admin");
        }

    }
}
