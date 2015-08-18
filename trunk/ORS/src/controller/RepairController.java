package controller;

import dao.*;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Th�nh on 01/06/2015.
 */
@WebServlet(name = "RepairController", urlPatterns = "/admin/repair")
public class RepairController extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        RepairDAO dao = new RepairDAO();
        String button = request.getParameter("button");

        if (action.equals("editing")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int contractId = Integer.parseInt(request.getParameter("contractId"));
            String assignedStaff = request.getParameter("assignedStaff");
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
                    sms.setMessage("Yeu cau sua chua cua ban khong duoc chap nhan.");
                    sms.send();
                    break;
                case "assign":
                    SimpleDateFormat fromUser = new SimpleDateFormat("dd-MM-yyyy");
                    SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String reformatted = null;
                    try {
                        reformatted = myFormat.format(fromUser.parse(assignedTime));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    Date date = java.sql.Date.valueOf(reformatted);
                    dao.update(id, contractId, assignedStaff, description, date, 2);
                    DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                    sms.setMessage("Yeu cau sua chua cua ban se duoc nhan vien cua chung toi den kiem tra." +
                            " Thoi gian du kien: " + df.format(date));
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
            response.sendRedirect("/admin/repair");

        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        RequestDispatcher rd;
        if (account != null && (account.getRoleId() == 2 || account.getRoleId() == 3)) {
            RepairDAO dao = new RepairDAO();
            String action = request.getParameter("action");
            if (action == null) {
                List<Repair> list;
                if (account.getRoleId() == 2) {
                    list = dao.findAll();
                } else {
                    list = dao.getRepairListByStaff(account.getUsername());
                }
                request.setAttribute("list", list);
                ScheduleService service = new ScheduleService();
                Map<Integer, Repair> suggestMap = service.makeRepairSchedule();
                request.setAttribute("suggestMap", suggestMap);
                rd = request.getRequestDispatcher("/WEB-INF/admin/repair/repair.jsp");
                rd.forward(request, response);
            } else if (action.equals("filter")) {
                String sId = request.getParameter("officeId");
                String staff = request.getParameter("staff");
                String officeName = "";
                int id = -1;
                OfficeDAO officeDAO = new OfficeDAO();
                List<Repair> list;
                Office office = null;
                if (sId != null) {
                    id = Integer.parseInt(sId);
                    office = officeDAO.get(id);
                    request.setAttribute("office", office.getName());
                    list = dao.getRepairListByFilter(id);
                } else {
                    officeName = new String(request.getParameter("office").getBytes(
                            "iso-8859-1"), "UTF-8");
                    list = dao.getRepairListByFilter(officeName, staff);
                }
                request.setAttribute("office", office != null ? office.getName() : officeName);
                request.setAttribute("staff", staff);
                request.setAttribute("list", list);
                rd = request.getRequestDispatcher("/WEB-INF/admin/repair/repair.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {
                request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
                Repair repair =  dao.get(Integer.parseInt(request.getParameter("id")));
                Collection<RepairDetail> repairDetails = repair.getRepairDetailsById();
                List<Amenity> list = new ArrayList<>();
                for (RepairDetail repairDetail : repairDetails) {
                    Amenity amenity = repairDetail.getAmenityByAmenityId();
                    list.add(amenity);
                }
                request.setAttribute("listAmenity", list);
                request.getRequestDispatcher("/WEB-INF/admin/repair/repairDetail.jsp").forward(request, response);
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
