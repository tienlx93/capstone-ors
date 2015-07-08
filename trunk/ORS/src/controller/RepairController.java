package controller;

import dao.RepairDAO;
import entity.Account;
import entity.Repair;
import service.ScheduleService;
import service.ScheduleService2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
            switch (button) {
                case "reject":
                    dao.changeStatus(id, 4);
                    break;
                case "assign":
                    Date date = java.sql.Date.valueOf(assignedTime);
                    dao.update(id, contractId, assignedStaff, description, date, 2);
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
        if (account != null && (account.getRoleId() == 2 || account.getRoleId() == 3)) {
            RepairDAO dao = new RepairDAO();
            String action = request.getParameter("action");
            if (action == null) {
                RepairDAO repairDAO = new RepairDAO();
                List<Repair> list;
                if (account.getRoleId() == 2) {
                    list = repairDAO.findAll();
                    ScheduleService2 service = new ScheduleService2();
                    Map<Integer, Repair> suggestMap = service.makeRepairSchedule();
                    request.setAttribute("suggestMap", suggestMap);
                } else {
                    list = repairDAO.getRepairListByStaff(account.getUsername());
                }
                request.setAttribute("list", list);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/repair/repair.jsp");
                rd.forward(request, response);
            } else if (action.equals("edit")) {
                request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
                request.getRequestDispatcher("/WEB-INF/admin/repair/repairDetail.jsp").forward(request, response);

            }
        } else {
            response.sendRedirect("/admin");
        }

    }

}
