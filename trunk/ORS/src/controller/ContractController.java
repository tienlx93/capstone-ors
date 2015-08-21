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
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
                Contract contract = new Contract();

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
                    officeChildren.setDescription(officeParent.getDescription());
                    officeChildren.setCreateDate(new Timestamp((new java.util.Date()).getTime()));
                    if (officeParent.getPrice() != null) {
                        officeChildren.setPrice(officeParent.getPrice());
                    }
                    officeChildren.setPriceTerm(officeParent.getPriceTerm());
                    officeChildren.setFloorNumber(officeParent.getFloorNumber());
                    officeChildren.setArea(Double.parseDouble(area));
                    officeChildren.setImageUrls("");
                    officeChildren.setLatitude(officeParent.getLatitude());
                    officeChildren.setLongitude(officeParent.getLongitude());
                    officeChildren.setDistrict(officeParent.getDistrict());
                    officeChildren.setCity(officeParent.getCity());
                    officeChildren.setMinTime(officeParent.getMinTime());
                    officeChildren.setMinArea(officeParent.getMinArea());
                    officeChildren.setBasePrice(officeParent.getBasePrice());
                    officeChildren.setOwnerName(officeParent.getOwnerName());
                    officeChildren.setOwnerPhone(officeParent.getOwnerPhone());
                    officeChildren.setOwnerAddress(officeParent.getOwnerAddress());
                    officeChildren.setImageUrls(officeParent.getImageUrls());
                    officeChildren.setParentOfficeId(officeParent.getId());

                    officeDao.save(officeChildren);

                    OfficeAmenityDAO officeAmenityDAO = new OfficeAmenityDAO();
                    List<OfficeAmenity> list = officeAmenityDAO.getAmenityIdByOfficeId(officeParent.getId());
                    List<Integer> amenityListInt = new ArrayList<>();

                    for (OfficeAmenity s : list) {
                        amenityListInt.add(s.getAmenityId());
                    }
                    OfficeAmenityDAO dao = new OfficeAmenityDAO();
                    dao.saveOfficeAmenity(officeChildren.getId(), amenityListInt);

                    officeParent.setArea(officeParent.getArea() - Double.parseDouble(area));
                    if (officeParent.getArea() < officeParent.getMinArea()) {
                        officeParent.setStatusId(2);
                    }
                    officeDao.update(officeParent.getId(), officeParent);
                    contract.setOfficeId(officeChildren.getId());
                } else if (Integer.parseInt(request.getParameter("categoryId")) == 1) {
                    OfficeDAO officeDao = new OfficeDAO();
                    Office office = officeDao.get(Integer.parseInt(request.getParameter("officeID")));

                    office.setStatusId(2);
                    officeDao.update(office.getId(), office);
                }

                ContractDAO dao = new ContractDAO();

                AppointmentDAO appointmentDao = new AppointmentDAO();
                String appointmentID = request.getParameter("appointmentID");

                appointmentDao.updateStatus(Integer.parseInt(appointmentID), 4);

                String customerName = request.getParameter("customerName");
                String officeID = request.getParameter("officeID");
                String startDateStr = request.getParameter("startDate");
                String endDateStr = request.getParameter("endDate");
                String paymentTerm = request.getParameter("paymentTerm");
                String paymentFee = request.getParameter("paymentFee");
                String deposit = request.getParameter("deposit");
                String imageUrl = request.getParameter("imageUrl");

                if(deposit == "") {
                    deposit = "0";
                }

                SimpleDateFormat fromUser = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");


                try {
                    String reformattedStart = myFormat.format(fromUser.parse(startDateStr));
                    String reformattedEnd = myFormat.format(fromUser.parse(endDateStr));
                    contract.setStartDate(Date.valueOf(reformattedStart));
                    contract.setEndDate(Date.valueOf(reformattedEnd));
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                contract.setStatusId(1);
                contract.setCustomerUsername(customerName);
                if (Integer.parseInt(request.getParameter("categoryId")) == 1) {
                    contract.setOfficeId(Integer.parseInt(officeID));
                }
                contract.setPaymentFee(Integer.parseInt(paymentFee));
                contract.setPaymentTerm(Integer.parseInt(paymentTerm));
                contract.setDeposit(Long.parseLong(deposit));
                contract.setImageUrl(imageUrl);
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
                Contract contract = dao.get(id);
                String endDate = request.getParameter("extendDate");
                SimpleDateFormat fromUser = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
                Contract newContract = new Contract();
                newContract.setCancelDate(contract.getCancelDate());
                newContract.setCancelFee(contract.getCancelFee());
                newContract.setStatusId(1);
                newContract.setDeposit(contract.getDeposit());
                newContract.setComment(contract.getComment());
                newContract.setOfficeId(contract.getOfficeId());
                newContract.setStartDate(contract.getEndDate());
                newContract.setCustomerUsername(contract.getCustomerUsername());
                newContract.setPaymentFee(contract.getPaymentFee());
                newContract.setPaymentTerm(contract.getPaymentTerm());
                try {
                    String reformattedEnd = myFormat.format(fromUser.parse(endDate));
                    newContract.setEndDate(Date.valueOf(reformattedEnd));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                switch (button) {
                    case "confirm":
                        dao.update(id, contract.getCustomerUsername(), contract.getOfficeId(), contract.getStartDate(), contract.getEndDate(), contract.getPaymentFee(), contract.getPaymentTerm(), 1);
                        dao.save(newContract);
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
//                        dao.changeStatus(id, 4);
                        String returnMoney = request.getParameter("returnMoney");
                        String returnDeposit = request.getParameter("returnDeposit");
                        // Update area for office parent when contract has been confirmed to expire
                        Contract contract = dao.get(id);

                        // add cancel date when return
                        contract.setCancelDate(new Date((new java.util.Date()).getTime()));
                        contract.setStatusId(4);
                        Long deposit = contract.getDeposit() - Long.parseLong(returnDeposit);
                        contract.setDeposit(deposit);
                        contract.setCancelFee(Long.getLong(returnMoney));

                        dao.updateContract(id, contract);

                        OfficeDAO officeDAO = new OfficeDAO();
                        Office office = officeDAO.get(contract.getOfficeId());
                        if (office.getParentOfficeId() != null) {
                            Office officeParent = officeDAO.get(office.getParentOfficeId());
                            officeDAO.updateArea(officeParent.getId(), officeParent.getArea() + office.getArea());
                        } else {
                            office.setStatusId(1);
                            officeDAO.update(office.getId(), office);
                        }

                        // Update rental item when contract has been confirmed to expire
                        RentalDAO rentalDAO = new RentalDAO();
                        List<Rental> rentals = rentalDAO.getRentalListByContract(contract.getId());

                        RentalDetailDAO rentalDetailDAO = new RentalDetailDAO();
                        RentalItemDAO rentalItemDAO = new RentalItemDAO();
                        if (rentals != null) {
                            for (Rental rental : rentals) {
                                List<RentalDetail> rentalDetailList = rentalDetailDAO.getRentalDetailByRental(rental.getId());
                                for (RentalDetail rentalDetail : rentalDetailList) {
                                    RentalItem rentalItem = rentalItemDAO.get(rentalDetail.getRentalItemId());
                                    rentalItemDAO.updateQuantity(rentalDetail.getRentalItemId(), rentalItem.getQuantity() + rentalDetail.getQuantity());
                                }
                            }
                        }

                        break;
                    case "cancel":
                        dao.changeStatus(id, 1);
                        break;
                }
                response.sendRedirect("/admin/contract");
                break;
            }
            case "update":
                String id = request.getParameter("contractId");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                String paymentTerm = request.getParameter("paymentTerm");
                String paymentFee = request.getParameter("paymentFee");

                ContractDAO contractDAO = new ContractDAO();
                Contract contract = contractDAO.get(Integer.parseInt(id));

                contract.setStartDate(Date.valueOf(startDate));
                contract.setEndDate(Date.valueOf(endDate));
                contract.setPaymentTerm(Integer.parseInt(paymentTerm));
                contract.setPaymentFee(Integer.parseInt(paymentFee));

                contractDAO.update(contract.getId(), contract.getCustomerUsername(), contract.getOfficeId(), contract.getStartDate(), contract.getEndDate(),
                        contract.getPaymentFee(), contract.getPaymentTerm(), contract.getStatusId());
                response.sendRedirect("/admin/contract");
                break;
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
                        Office office = officeDao.get(appointment.getOfficeId());
                        Long price = office.getPrice();
                        if (price != null && office.getCategoryId() == 1) {
                            price = Math.round(office.getPrice() / office.getArea() / 1000) * 1000;
                        }
                        office.setPrice(price);
                        request.setAttribute("office", office);

                        request.setAttribute("paymentTermList", paymentTermList);

                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/newContract.jsp");
                        rd.forward(request, response);
                        break;
                    case "edit":
                        String id = request.getParameter("id");

                        Contract contract = dao.get(Integer.parseInt(id));
                        request.setAttribute("contract", contract);

                        request.setAttribute("paymentTermList", paymentTermList);

                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/editContract.jsp");
                        rd.forward(request, response);
                        break;
                    case "editing":
                        String ids = request.getParameter("id");

                        Contract contract1 = dao.get(Integer.parseInt(ids));
                        request.setAttribute("contract", contract1);

                        request.setAttribute("paymentTermList", paymentTermList);

                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/contractDetail.jsp");
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
                    case "viewProfile":
                        AccountDAO daoAcc = new AccountDAO();
                        request.setAttribute("info", daoAcc.get(request.getParameter("username")));
                        request.getRequestDispatcher("/WEB-INF/admin/contract/userProfileByContract.jsp").forward(request, response);
                        break;
                }
            }

        } else {
            response.sendRedirect("/admin");
        }
    }
}