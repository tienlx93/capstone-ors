package controller;

import dao.*;
import entity.*;
import service.ConstantService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.StringTokenizer;

/**
 * Created by xps on 6/2/2015.
 */
@WebServlet(name = "ContractController", urlPatterns = {"/admin/contract"})
public class ContractController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String button = request.getParameter("button");
        switch (action) {
            case "save": {
                if (Integer.parseInt(request.getParameter("categoryId")) == 2) {
                    OfficeDAO officeDao = new OfficeDAO();
                    Office officeParent = officeDao.get(Integer.parseInt(request.getParameter("officeID")));

                    String area = request.getParameter("officeArea");
                    String address = request.getParameter("officeAddress");
                    Office officeChildren = new Office();

                    officeChildren.setStatusId(2);
                    officeChildren.setName(officeParent.getName());
                    officeChildren.setAddress(address);
                    officeChildren.setCategoryId(officeParent.getCategoryId());
                    officeChildren.setDescription("");
                    officeChildren.setCreateDate(new Timestamp((new java.util.Date()).getTime()));
                    if (!officeChildren.equals("")) {
                        officeChildren.setPrice(officeParent.getPrice());
                    }
                    officeChildren.setPriceTerm(officeParent.getPriceTerm());
                    if (!officeChildren.equals("")) {
                        officeChildren.setFloorNumber(officeParent.getFloorNumber());
                    }
                    officeChildren.setArea(Double.parseDouble(area));
                    officeChildren.setImageUrls("");
                    officeChildren.setLatitude(officeParent.getLatitude());
                    officeChildren.setLongitude(officeParent.getLongitude());
                    officeChildren.setDistrict(officeParent.getDistrict());
                    officeChildren.setCity(officeParent.getCity());
                    officeChildren.setParentOfficeId(officeParent.getId());

                    officeDao.save(officeChildren);

                    officeDao.updateArea(officeParent.getId(), officeParent.getArea() - Double.parseDouble(area));
                }

                ContractDAO dao = new ContractDAO();
                Contract contract = new Contract();

                AppointmentDAO appointmentDao = new AppointmentDAO();
                String appointmentID = request.getParameter("appointmentID");

                appointmentDao.updateStatus(Integer.parseInt(appointmentID), 4);

                String customerName = request.getParameter("customerName");
                String officeID = request.getParameter("officeID");
                String startDateStr = request.getParameter("startDate");
                String endDateStr = request.getParameter("endDate");
                String paymentTerm = request.getParameter("paymentTerm");
                String paymentFee = request.getParameter("paymentFee");


                contract.setStatusId(1);
                contract.setCustomerUsername(customerName);
                contract.setOfficeId(Integer.parseInt(officeID));
                contract.setStartDate(Date.valueOf(startDateStr));
                contract.setEndDate(Date.valueOf(endDateStr));
                contract.setPaymentFee(Integer.parseInt(paymentFee));
                contract.setPaymentTerm(Integer.parseInt(paymentTerm));

                dao.save(contract);
                response.sendRedirect("/admin/contract");
                break;
            }
            case "cancel": {
                AppointmentDAO appointmentDao = new AppointmentDAO();
                String appointmentID = request.getParameter("appointmentID");

                appointmentDao.updateStatus(Integer.parseInt(appointmentID), 4);
                response.sendRedirect("/admin/contract");
                break;
            }
            case "editExtend": {
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
                break;
            }
            case "editReturn": {
                int id = Integer.parseInt(request.getParameter("id"));
                ContractDAO dao = new ContractDAO();
                switch (button) {
                    case "confirm":
                        dao.changeStatus(id, 3);
                        break;
                    case "cancel":
                        dao.changeStatus(id, 1);
                        break;
                }
                response.sendRedirect("/admin/contract");
                break;
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContractDAO dao = new ContractDAO();
        String action = request.getParameter("action");
        RequestDispatcher rd;
        PaymentTermDAO ptDao = new PaymentTermDAO();
        List<PaymentTerm> paymentTermList = ptDao.findAll();
        List<Contract> list = dao.findAll();
        request.setAttribute("data", list);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        if (account != null && (account.getRoleId() == 2)) {
            if (action == null) {
                int pageCount = dao.getPageCount(ConstantService.PAGE_SIZE);
                request.setAttribute("pageCount", pageCount);
                List<Contract> list1 = dao.getContractByPage(0, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list1);
                rd = request.getRequestDispatcher("/WEB-INF/admin/contract/viewContract.jsp");
                rd.forward(request, response);
            } else if (action.equals("page")) {
                String startPage = request.getParameter("startPage");
                int page = Integer.parseInt(startPage);
                int startItem = (page - 1) * ConstantService.PAGE_SIZE;
                List<Contract> list1 = dao.getContractByPage(startItem, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list1);
                rd = request.getRequestDispatcher("/WEB-INF/partial/contractListItem.jsp");
                rd.forward(request, response);
            } else {
                switch (action) {
                    case "new":
                        AppointmentDAO appointmentDao = new AppointmentDAO();
                        Appointment appointment = appointmentDao.get(Integer.parseInt(request.getParameter("id")));
                        request.setAttribute("appointmentList", appointment);

                        OfficeDAO officeDao = new OfficeDAO();
                        request.setAttribute("office", officeDao.get(appointment.getOfficeId()));


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

                        request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/returnContract.jsp");
                        rd.forward(request, response);
                        break;
                    case "viewExtend":

                        request.setAttribute("paymentTermList", paymentTermList);
                        request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/extendContract.jsp");
                        rd.forward(request, response);
                        break;
                }
            }

        }else {
            response.sendRedirect("/admin");
        }
    }
}