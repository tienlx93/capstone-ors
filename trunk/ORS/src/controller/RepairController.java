package controller;

import dao.RepairDAO;
import entity.Repair;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Th�nh on 01/06/2015.
 */
@WebServlet(name = "RepairController", urlPatterns = "/Repair" )
public class RepairController extends HttpServlet {

    RepairDAO dao = new RepairDAO();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equals("editing")) {
            Repair rp = new Repair();
            rp.setId(Integer.parseInt(request.getParameter("id")));
            rp.setContractId(Integer.parseInt((request.getParameter("contractId"))));
            rp.setAssignedStaff(request.getParameter("assignedStaff"));
            rp.setType(request.getParameter("type"));
            rp.setDescription(request.getParameter("description"));
            rp.setRepairStatusId(Integer.parseInt(request.getParameter("repairStatusId")));
            dao.save(rp);
            response.sendRedirect("/WEB-INF/Repair.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Repair.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")) {
            request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
            request.getRequestDispatcher("/WEB-INF/RepairDetail.jsp").forward(request, response);

        }
    }

}
