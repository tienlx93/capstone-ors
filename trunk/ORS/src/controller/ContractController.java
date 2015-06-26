package controller;

import dao.*;
import entity.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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
        if (action.equals("save")) {
            if(Integer.parseInt(request.getParameter("categoryId")) == 2) {
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
                officeChildren.setCreateDate(new Timestamp((new Date()).getTime()));
                if (!officeChildren.equals("")) {
                    officeChildren.setPrice(officeParent.getPrice());
                }
                officeChildren.setPriceTerm(officeParent.getPriceTerm());
                if (!officeChildren.equals("")) {
                    officeChildren.setFloorNumber(officeParent.getFloorNumber());
                }
                officeChildren.setArea(Double.parseDouble(area));
                officeChildren.setImageUrls("");
                officeChildren.setOfficeAmenitiesById(officeParent.getOfficeAmenitiesById());
                officeChildren.setLatitude(officeParent.getLatitude());
                officeChildren.setLongitude(officeParent.getLongitude());
                officeChildren.setDistrict(officeParent.getDistrict());
                officeChildren.setCity(officeParent.getCity());
                officeChildren.setParentOfficeId(officeParent.getId());

                OfficeDAO officeChildrenDao = new OfficeDAO();
                officeChildrenDao.save(officeChildren);
            }

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
            switch (action) {
                case "new":
                    AppointmentDAO appointmentDao = new AppointmentDAO();
                    Appointment appointment = appointmentDao.get(Integer.parseInt(request.getParameter("id")));
                    request.setAttribute("appointmentList", appointment);

                    OfficeDAO officeDao = new OfficeDAO();
                    request.setAttribute("office", officeDao.get(appointment.getOfficeId()));

                    PaymentTermDAO ptDao = new PaymentTermDAO();
                    List<PaymentTerm> paymentTermList = ptDao.findAll();
                    request.setAttribute("paymentTermList", paymentTermList);

                    rd = request.getRequestDispatcher("/WEB-INF/admin/contract/newContract.jsp");
                    rd.forward(request, response);
                    break;
                case "return":
                    rd = request.getRequestDispatcher("/WEB-INF/admin/contract/request.jsp");
                    rd.forward(request, response);
                    break;
                case "extend":
                    rd = request.getRequestDispatcher("/WEB-INF/admin/contract/request.jsp");
                    rd.forward(request, response);
                    break;
            }
        }

    }

    private List<String> saveAmenities(String amenities) {
        StringTokenizer tokenizer = new StringTokenizer(amenities, ",");
        List<String> amenityList = new ArrayList<>();
        while (tokenizer.hasMoreTokens()) {
            amenityList.add(tokenizer.nextToken());
        }
        AmenityDAO amenityDAO = new AmenityDAO();
        OfficeAmenityDAO officeAmenityDAO = new OfficeAmenityDAO();
        if (amenityDAO.addAmenities(amenityList)) {
            officeAmenityDAO.findAll();
        }
        return amenityList;
    }
}
