package controller;

import dao.RentalDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Thành on 08/06/2015.
 */
@WebServlet(name = "RentalController", urlPatterns = "/admin/rental")
public class RentalController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        RentalDAO dao = new RentalDAO();
        if (action.equals("editing")) {
            dao.update(Integer.parseInt(request.getParameter("id")),Integer.parseInt((request.getParameter("contractId"))),
                    request.getParameter("assignStaff"),Integer.parseInt(request.getParameter("statusId")), request.getParameter("description"));
            response.sendRedirect("/admin/rental");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RentalDAO dao = new RentalDAO();
        String action = request.getParameter("action");
        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/rental/rental.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")) {
            request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
            request.getRequestDispatcher("/WEB-INF/admin/rental/rentalDetail.jsp").forward(request, response);

        } else if (action.equals("new")) {
            request.getRequestDispatcher("/WEB-INF/admin/rental/newRentalItem.jsp").forward(request, response);
        }
    }
}
