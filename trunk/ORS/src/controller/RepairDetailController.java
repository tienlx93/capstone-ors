package controller;

import dao.RepairDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Thành on 02/06/2015.
 */
@WebServlet(name = "RepairDetailController", urlPatterns = "/demoRepairDetail")
public class RepairDetailController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RepairDAO dao = new RepairDAO();
        String action = request.getParameter("action");
        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/demoRepairDetail.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")) {
            request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
            request.getRequestDispatcher("demoRepairDetail.jsp").forward(request, response);

        }
    }
}
