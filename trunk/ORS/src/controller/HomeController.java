package controller;

import dao.*;
import entity.Account;
import entity.RentalItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ASUS on 7/21/2015.
 */
@WebServlet(name = "HomeController", urlPatterns = {"/admin/home"})
public class HomeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        if (account == null) {
            response.sendRedirect("/admin");
        } else {
            String staff = account.getUsername();
            request.setAttribute("user", account);
            if (account.getRoleId() == 1) {
                AccountDAO accountDAO = new AccountDAO();
                int count = accountDAO.getPageCount(1);
                request.setAttribute("numUser", count);
            } else {
                OfficeDAO officeDAO = new OfficeDAO();
                if (account.getRoleId() == 5) {
                    request.setAttribute("numOffice", officeDAO.getPageCount(1, account.getUsername()));
                } else {
                    request.setAttribute("numOffice", officeDAO.getPageCount(1));
                }
                AppointmentDAO appointmentDAO = new AppointmentDAO();
                ContractDAO contractDAO = new ContractDAO();
                RentalItemDAO rentalItemDAO = new RentalItemDAO();
                long numAppointment, numContract = 0, numReturn = 0, numExtend = 0, numRepair, numRental, numRentalItem = 0;
                if (account.getRoleId() == 2) {
                    numAppointment = appointmentDAO.countAppointment(1, null);
                    numContract = contractDAO.countContractByStatus(1);
                    numReturn = contractDAO.countContractByStatus(3);
                    numExtend = contractDAO.countContractByStatus(2);
                    numRepair = appointmentDAO.countRepair(2, null);
                    numRental = appointmentDAO.countRental(1, null);
                    numRentalItem = rentalItemDAO.getPageCount(1);
                } else if(account.getRoleId() == 5) {
                    numRepair = appointmentDAO.countOwnerRepair(account.getUsername());
                    numContract = contractDAO.countContractByOfficeOwner(account.getUsername());
                    numAppointment = 0;
                    numRental = 0;
                } else {
                    numAppointment = appointmentDAO.countAppointment(2, staff);
                    numRepair = appointmentDAO.countRepair(5, staff);
                    numRental = appointmentDAO.countRental(2, staff);
                }
                request.setAttribute("numAppointment", numAppointment);
                request.setAttribute("numContract", numContract);
                request.setAttribute("numReturn", numReturn);
                request.setAttribute("numExtend", numExtend);
                request.setAttribute("numRepair", numRepair);
                request.setAttribute("numRental", numRental);
                request.setAttribute("numRentalItem", numRentalItem);
            }

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/home/list.jsp");
            rd.forward(request, response);
        }
    }
}
