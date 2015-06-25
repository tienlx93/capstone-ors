package controller;

import dao.AppointmentDAO;
import dao.ContractDAO;
import dao.PaymentTermDAO;
import entity.Appointment;
import entity.Contract;
import entity.PaymentTerm;
import entity.PriceTerm;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

/**
 * Created by xps on 6/2/2015.
 */
@WebServlet(name = "ContractController", urlPatterns = {"/admin/contract"})
public class ContractController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String button = request.getParameter("button");
        if (action.equals("save")) {
            ContractDAO dao = new ContractDAO();
            Contract contract = new Contract();

            AppointmentDAO appointmentDao = new AppointmentDAO();
            String appointmentID = request.getParameter("appointmentID");

            appointmentDao.updateStatus(Integer.parseInt(appointmentID),4);

            String customerName = request.getParameter("customerName");
            String officeID = request.getParameter("officeID");
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String paymentTerm = request.getParameter("paymentTerm");
//            String paymentFee = request.getParameter("paymentFee");


            contract.setStatusId(1);
            contract.setCustomerUsername(customerName);
            contract.setOfficeId(Integer.parseInt(officeID));
            contract.setStartDate(java.sql.Date.valueOf(startDateStr));
            contract.setEndDate(java.sql.Date.valueOf(endDateStr));
//            contract.setPaymentFee(Integer.parseInt(paymentFee));
            contract.setPaymentTerm(Integer.parseInt(paymentTerm));

            dao.save(contract);
            response.sendRedirect("/admin/contract");
        } else if (action.equals("cancel")) {
            String comment = request.getParameter("comment");

            AppointmentDAO appointmentDao = new AppointmentDAO();
            String appointmentID = request.getParameter("appointmentID");

            appointmentDao.updateStatus(Integer.parseInt(appointmentID),4);
            response.sendRedirect("/admin/contract");
        } else if (action.equals("editExtend")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ContractDAO dao = new ContractDAO();
            String customerUsername = request.getParameter("customerUsername");
            int officeId = Integer.parseInt(request.getParameter("officeId"));
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            int paymentFee = Integer.parseInt(request.getParameter("paymentFee"));
            int paymentTerm = Integer.parseInt(request.getParameter("paymentTerm"));
            switch (button) {
                case "confirm":
                    dao.update(id, customerUsername, officeId, startDate, endDate, paymentFee, paymentTerm, 1);
                    break;
                case "cancel":
                    dao.changeStatus(id, 1);
                    break;
            }
            response.sendRedirect("/admin/contract");
        } else if (action.equals("editReturn")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ContractDAO dao = new ContractDAO();
            switch (button) {
                case "confirm":
                    dao.changeStatus(id, 4);
                    break;
                case "cancel":
                    dao.changeStatus(id, 1);
                    break;
            }
            response.sendRedirect("/admin/contract");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContractDAO dao = new ContractDAO();
        String action = request.getParameter("action");
        RequestDispatcher rd;
        if (action == null) {
            List<Contract> list = dao.findAll();
            request.setAttribute("data", list);
            rd = request.getRequestDispatcher("/WEB-INF/admin/contract/viewContract.jsp");
            rd.forward(request, response);
        } else {
            List<Contract> list = dao.findAll();
            request.setAttribute("dataList", list);
            ContractDAO contractDAO = new ContractDAO();
            PaymentTermDAO ptDao = new PaymentTermDAO();
            List<PaymentTerm> paymentTermList = ptDao.findAll();
            switch (action) {
                case "new":
                    AppointmentDAO appointmentDao = new AppointmentDAO();
                    request.setAttribute("appointmentList", appointmentDao.get(Integer.parseInt(request.getParameter("id"))));

                    request.setAttribute("paymentTermList", paymentTermList);

                    rd = request.getRequestDispatcher("/WEB-INF/admin/contract/newContract.jsp");
                    rd.forward(request, response);
                    break;
                case "return":

                    request.setAttribute("titleName", "huy");
                    rd = request.getRequestDispatcher("/WEB-INF/admin/contract/request.jsp");
                    rd.forward(request, response);
                    break;
                case "extend":
                    request.setAttribute("titleName", "giahan");
                    rd = request.getRequestDispatcher("/WEB-INF/admin/contract/request.jsp");
                    rd.forward(request, response);
                    break;
                case "viewReturn":

                    request.setAttribute("info", contractDAO.get(Integer.parseInt(request.getParameter("id"))));
                    rd = request.getRequestDispatcher("/WEB-INF/admin/contract/returnContract.jsp");
                    rd.forward(request, response);
                    break;
                case "viewExtend":

                    request.setAttribute("paymentTermList", paymentTermList);
                    request.setAttribute("info", contractDAO.get(Integer.parseInt(request.getParameter("id"))));
                    rd = request.getRequestDispatcher("/WEB-INF/admin/contract/extendContract.jsp");
                    rd.forward(request, response);
                    break;
            }
        }

    }
}
