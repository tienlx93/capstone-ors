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
 * Created by Thành on 01/06/2015.
 */
@WebServlet(name = "RepairController", urlPatterns = {"/demoRepair"} )
public class RepairController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RepairDAO dao = new RepairDAO();
        String action = request.getParameter("action");
        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/demoRepair.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")) {
            request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
            request.getRequestDispatcher("demoRepairDetail.jsp").forward(request, response);

        }
    }

}
