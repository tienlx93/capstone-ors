package controller;

import dao.RentalDAO;
import dao.RentalDetailDAO;
import entity.Account;
import entity.Rental;
import entity.RentalDetail;
import service.ConstantService;
import service.ScheduleService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
            switch (button) {
                case "reject":
                    dao.changeStatus(id, 4);
                    break;
                case "assign":
                    dao.update(id, contractId, assignStaff, 2, description);
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
                if (account.getRoleId()==2) {
                    ScheduleService service = new ScheduleService();
                    Map<Integer, Rental> suggestMap = service.makeRentalSchedule();
                    request.setAttribute("suggestMap", suggestMap);
                    list = rentalDAO.findAll();
                } else {
                    list = rentalDAO.getRentalListByStaff(account.getUsername());
                }
                request.setAttribute("data", list);

                /*int pageCount = dao.getPageCount(ConstantService.PAGE_SIZE);
                request.setAttribute("pageCount", pageCount);*/

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
            } /*else if (action.equals("page")) {
                String startPage = request.getParameter("startPage");
                int page = Integer.parseInt(startPage);
                int startItem = (page - 1) * ConstantService.PAGE_SIZE;
                List<Rental> list = dao.getRentalByPage(startItem, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list);
                request.getRequestDispatcher("/WEB-INF/partial/officeListItem.jsp");
            }*/
        } else {
            response.sendRedirect("/admin");
        }
    }
}
