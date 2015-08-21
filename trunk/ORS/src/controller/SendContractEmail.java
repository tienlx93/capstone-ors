package controller;

import dao.ContractDAO;
import dao.EmailQueueDAO;
import entity.Contract;
import entity.EmailQueue;
import service.EmailService;
import service.EmailServletResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by xps on 7/21/2015.
 */
@WebServlet(name = "SendContractEmail", urlPatterns = {"/contractMail"})
public class SendContractEmail extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContractDAO contractDAO = new ContractDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        int status = Integer.parseInt(request.getParameter("status"));
        String email = request.getParameter("email");

        Contract contract = contractDAO.get(id);
        String fullName = contract.getAccountByCustomerUsername().getProfileByUsername().getFullName();
        switch (status){
            case 1:
                request.setAttribute("content", "sắp hết hạn");
                request.setAttribute("contract", contract.getOfficeByOfficeId().getName());
                break;
            case 4:
                request.setAttribute("content", "đã hết hạn");
                request.setAttribute("contract", contract.getOfficeByOfficeId().getName());
                break;
            default:
                break;
        }
        request.setAttribute("fullName", fullName);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/email/contractEmail.jsp");

        EmailServletResponse res2 = new EmailServletResponse(response);
        rd.forward(request, res2);

        EmailService service = new EmailService();
        service.setReceiver(email);
        service.setSubject("Thông báo hợp đồng thuê văn phòng");
        service.setContent(res2.getOutput());
        service.sendEmail();
        response.getWriter().print(res2.getOutput());
    }
}
