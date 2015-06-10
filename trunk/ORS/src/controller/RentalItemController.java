package controller;

import dao.RentalItemDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Thành on 10/06/2015.
 */
@WebServlet(name = "RentalItemController", urlPatterns = "/admin/rentalItem")
public class RentalItemController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        RentalItemDAO dao = new RentalItemDAO();
        if (action.equals("editing")) {
            dao.update(Integer.parseInt(request.getParameter("id")), request.getParameter("name"),
                    request.getParameter("description"), request.getParameter("price"), request.getParameter("quantity"));
            response.sendRedirect("/admin/rentalItem");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RentalItemDAO dao = new RentalItemDAO();
        String action = request.getParameter("action");
        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/rental/rentalItem.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")) {
            request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
            request.getRequestDispatcher("/WEB-INF/admin/rental/rentalItemDetail.jsp").forward(request, response);

        } else if (action.equals("new")) {

        }
    }
}
