package controller;

import dao.ContractDAO;
import dao.OfficeDAO;
import dao.RentalDAO;
import dao.RentalDetailDAO;
import entity.*;
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
 * Created by Thành on 08/06/2015.
 */
@WebServlet(name = "RentalController", urlPatterns = "/admin/rental")
public class RentalController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        RentalDAO dao = new RentalDAO();
        String button = request.getParameter("button");

        if (action.equals("editing")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int contractId = Integer.parseInt(request.getParameter("contractId"));
            String assignStaff = request.getParameter("assignStaff");
            String description = request.getParameter("description");
            String assignedTime = request.getParameter("assignedTime");
            
            SMSService sms = new SMSService();
            ContractDAO contractDAO = new ContractDAO();
            Contract current = contractDAO.get(contractId);
            String phone = current.getAccountByCustomerUsername().getProfileByUsername().getPhone();
            sms.setPhone(phone);
            switch (button) {
                case "reject":
                    dao.changeStatus(id, 4);
                    sms.setMessage("Yeu cau thue vat dung cua ban khong duoc chap nhan.");
                    sms.send();
                    break;
                case "assign":
                    Date date = java.sql.Date.valueOf(assignedTime);
                    dao.update(id, contractId, assignStaff, 2, description, date);
                    DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                    sms.setMessage("Yeu cau thue vat dung cua ban da duoc chap nhan. Thoi gian du kien: " + df.format(date));
                    sms.send();
                    break;
                case "change1":
                    dao.changeStatus(id, 1);
                    break;
                case "change3":
                    dao.changeStatus(id, 3);
                    break;
                case "change5":
                    dao.changeStatus(id, 5);
                    break;
            }
            response.sendRedirect("/admin/rental");

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        if (account != null && (account.getRoleId() == 2 || account.getRoleId() == 3)) {
            RentalDAO dao = new RentalDAO();
            String action = request.getParameter("action");
            if (action == null) {
                RentalDAO rentalDAO = new RentalDAO();
                List<Rental> list;
                if (account.getRoleId() == 2) {
                    ScheduleService service = new ScheduleService();
                    Map<Integer, Rental> suggestMap = service.makeRentalSchedule();
                    request.setAttribute("suggestMap", suggestMap);
                    list = rentalDAO.findAll();
                } else {
                    list = rentalDAO.getRentalListByStaff(account.getUsername());
                }
                request.setAttribute("data", list);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/rental/rental.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {
                request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
                RentalDetailDAO rdd = new RentalDetailDAO();
                List<RentalDetail> detailList = rdd.getRentalDetailByRental(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("detailList", detailList);
                request.getRequestDispatcher("/WEB-INF/admin/rental/rentalDetail.jsp").forward(request, response);

            } else if (action.equals("new")) {
                request.getRequestDispatcher("/WEB-INF/admin/rental/newRentalItem.jsp").forward(request, response);
            } else if (action.equals("filter")) {
                String office = new String(request.getParameter("office").getBytes(
                        "iso-8859-1"), "UTF-8");
                String staff = request.getParameter("staff");
                List<Rental> list;
                list = dao.getRentalListByFilter(office, staff);
                request.setAttribute("office", office);
                request.setAttribute("staff", staff);
                request.setAttribute("data", list);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/rental/rental.jsp");
                rd.forward(request, response);
            }
        } else {
            response.sendRedirect("/admin");
        }
    }
}
