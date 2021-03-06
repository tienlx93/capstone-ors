package controller;

import com.google.gson.Gson;
import dao.*;
import entity.*;
import json.*;
import org.quartz.*;
import org.quartz.impl.JobDetailImpl;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.triggers.SimpleTriggerImpl;
import service.ConstantService;
import service.MatchingService;
import service.SMSService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 * Created by ASUS on 6/9/2015.
 */
@WebServlet(name = "ApiController", urlPatterns = "/api")
public class ApiController extends HttpServlet {
    private Gson gson;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();

        gson = new Gson();

        String action = request.getParameter("action");
        switch (action) {
            case "changeStatus":
                try {
                    changeStatus(request, out);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                break;
            case "contractReturn":
                contractReturn(request, out);
                break;
            case "contractReturnAfter":
                contractReturnAfter(request, out);
                break;
            case "contractExtend":
                contractExtend(request, out);
                break;
            case "login":
                login(request, out);
                break;
            case "register":
                try {
                    register(request, out);
                } catch (ParseException e) {
                    out.print(gson.toJson("Error"));
                    e.printStackTrace();
                }
                break;
            case "requestOffice":
                requestOffice(request, out);
                break;
            case "editProfile":
                try {
                    editProfile(request, out);
                } catch (ParseException e) {
                    out.print(gson.toJson("Error"));
                    e.printStackTrace();
                }
                break;
            case "checkLogin":
                checkLogin(request, out);
                break;
            case "editPass":
                editPass(request, out);
                break;
            case "logout":
                logout(request, out);
                break;
            case "requestAppointment":
                requestAppointment(request, out);
                break;
            case "requestRepair":
                requestRepair(request, out);
                break;
            case "requestRental":
                requestRental(request, out);
                break;
            case "unsubscribeRequest":
                unsubscribeRequest(request, out);
                break;
            default:
                out.print(gson.toJson("Error"));
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();

        gson = new Gson();

        String action = request.getParameter("action");
        switch (action) {
            case "getOffice":
                getOffice(request, out);
                break;
            case "getAmenityByOfficeId":
                getAmenityByOfficeId(request, out);
                break;
            case "getContractList":
                getContractList(request, out);
                break;
            case "getContractHistoryList":
                getContractHistoryList(request, out);
                break;
            case "checkContractReturn":
                checkContractReturn(request, out);
                break;
            case "getProfile":
                getProfile(request, out);
                break;
            case "getOnlyOfficeName":
                getOnlyOfficeName(request, out);
                break;
            case "getRentalList":
                getRentalList(request, out);
                break;
            case "getRentalListDone":
                getRentalListDone(request, out);
                break;
            case "getRentalDetail":
                getRentalDetail(request, out);
                break;
            case "getAmenityList":
                getAmenityList(request, out);
                break;
            case "getRepairList":
                getRepairList(request, out);
                break;
            case "getRepairHistoryList":
                getRepairHistoryList(request, out);
                break;
            case "getAllOffice":
                getAllOffice(request, out);
                break;
            case "listMobile":
                listMobile(request, out);
                break;
            case "detailMobile":
                detailMobile(request, out);
                break;
            case "countAssigned":
                countAssigned(request, out);
                break;
            case "searchOfficeByAddress":
                searchOfficeByAddress(request, out);
                break;
            case "getNewOffice":
                getNewOffice(request, out);
                break;
            case "getContractById":
                try {
                    getContractById(request, out);
                } catch (ParseException e) {
                    out.print(gson.toJson("Error"));
                }
                break;
            case "getContractChildById":
                try {
                    getContractChildById(request, out);
                } catch (ParseException e) {
                    out.print(gson.toJson("Error"));
                }
                break;
            case "amenity":
                getAmenityList(request, out);
                break;
            case "amenityWeight":
                getAmenityListWeight(request, out);
                break;
            case "officeName":
                getOfficeName(request, out);
                break;
            case "getAllOfficeRentalList":
                getAllOfficeRentalList(request, out);
                break;
            case "matching":
                matching(request, out);
                break;
            case "getRelativeOffice":
                getRelativeOffice(request, out);
                break;
            case "getResultRequestOffice":
                getResultRequestOffice(request, out);
                break;
            case "getRequestOffice":
                getRequestOffice(request, out);
                break;
            case "getCurrentTime":
                getCurrentTime(request, out);
                break;
            default:
                out.print(gson.toJson("Error"));
        }

        out.flush();
    }

    private void getCurrentTime(HttpServletRequest request, PrintWriter out) {
        Long now = new Date().getTime();
        out.print(gson.toJson(now));
    }

    private void getOfficeName(HttpServletRequest request, PrintWriter out) {
        List<String> officeList = new ArrayList<>();
        OfficeDAO dao = new OfficeDAO();
        for (Office office : dao.findAll()) {
            officeList.add(office.getName());
        }

        out.print(gson.toJson(officeList));
    }

    private void getOffice(HttpServletRequest request, PrintWriter out) {
        String officeId = request.getParameter("officeId");
        if (officeId != null) {
            int id = Integer.parseInt(officeId);
            Office office;
            OfficeDAO dao = new OfficeDAO();
            office = dao.viewOffice(id);
            if (office != null) {
                OfficeJSON json = new OfficeJSON(office);
                out.print(gson.toJson(json));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Missing officeId"));
        }
    }

    private void getAllOffice(HttpServletRequest request, PrintWriter out) {
        List<OfficeListDetail> officeList = new ArrayList<>();
        OfficeDAO dao = new OfficeDAO();
        for (Office office : dao.findAll()) {
            officeList.add(new OfficeListDetail(office));
        }

        out.print(gson.toJson(officeList));
    }

    private void getNewOffice(HttpServletRequest request, PrintWriter out) {
        List<OfficeListDetail> officeList = new ArrayList<>();
        OfficeDAO dao = new OfficeDAO();
        for (Office office : dao.getNewOffice()) {
            officeList.add(new OfficeListDetail(office));
        }

        out.print(gson.toJson(officeList));
    }

    private void listMobile(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account.getRoleId() == 3) {
            String username = account.getUsername();
            String type = request.getParameter("type");
            List<MobileListJSON> list = new ArrayList<>();
            Office office;
            Profile profile;
            switch (type) {
                case "appointment": {
                    AppointmentDAO dao = new AppointmentDAO();

                    for (Appointment appointment : dao.getAppointmentListByStaffAndOffice(username, "")) {
                        office = appointment.getOfficeByOfficeId();
                        profile = appointment.getAccountByCustomerUsername().getProfileByUsername();
                        if (appointment.getStatusId() == 2) {
                            list.add(new MobileListJSON(appointment.getId(), office.getName(), office.getAddress(),
                                    profile.getFullName(), appointment.getTime().toString(), appointment.getStatusId(), office));
                        }
                    }

                    break;
                }
                case "rental": {
                    RentalDAO dao = new RentalDAO();

                    for (Rental rental : dao.getRentalListByStaff(username)) {
                        office = rental.getContractByContractId().getOfficeByOfficeId();
                        if (rental.getStatusId() == 2 || rental.getStatusId() == 5) {
                            list.add(new MobileListJSON(rental.getId(), office.getName(), office.getAddress(),
                                    rental.getDescription(), rental.getAssignedTime().toString(), rental.getStatusId(), office));
                        }
                    }

                    break;
                }
                case "repair": {
                    RepairDAO dao = new RepairDAO();

                    for (Repair repair : dao.getRepairListByStaff(username)) {
                        office = repair.getContractByContractId().getOfficeByOfficeId();
                        if (repair.getRepairStatusId() == 5) {
                            list.add(new MobileListJSON(repair.getId(), office.getName(), office.getAddress(),
                                    repair.getDescription(), repair.getAssignedTime().toString(), repair.getRepairStatusId(), office));
                        }
                    }
                    break;
                }
            }
            out.print(gson.toJson(list));
        } else {
            out.print(gson.toJson("Error"));
        }

    }

    private void searchOfficeByAddress(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
//        String address = request.getParameter("address");
//
//        byte[] bytes = address.getBytes(StandardCharsets.ISO_8859_1);
//        address = new String(bytes, StandardCharsets.UTF_8);

        final String address = new String(request.getParameter("address").getBytes(
                "iso-8859-1"), "UTF-8");

        List<OfficeListDetail> officeList = new ArrayList<>();

        OfficeDAO dao = new OfficeDAO();
        for (Office office : dao.getOfficeByAddress(address)) {
            officeList.add(new OfficeListDetail(office));
        }
        out.print(gson.toJson(officeList));
    }

    private void detailMobile(HttpServletRequest request, PrintWriter out) {
        String type = request.getParameter("type");
        String id = request.getParameter("id");
        int detailId = Integer.parseInt(id);
        MobileDetailJSON detail = null;
        switch (type) {
            case "appointment": {
                AppointmentDAO dao = new AppointmentDAO();

                Appointment appointment = dao.get(detailId);
                if (appointment != null) {
                    Office office = appointment.getOfficeByOfficeId();
                    Profile profile = appointment.getAccountByCustomerUsername().getProfileByUsername();

                    detail = new MobileDetailJSON();
                    detail.setId(appointment.getId());
                    detail.setOfficeName(office.getName());
                    detail.setAddress(office.getAddress());
                    detail.setLatitude(office.getLatitude() != null ? office.getLatitude() : 0);
                    detail.setLongitude(office.getLongitude() != null ? office.getLongitude() : 0);
                    detail.setCustomerName(profile.getFullName());
                    detail.setCustomerPhone(profile.getPhone());
                    detail.setDetail("");
                    detail.setDate(appointment.getTime().toString());
                    detail.setStatus(appointment.getStatusId());
                    detail.setList(new ArrayList<String>());
                    String images = office.getImageUrls();
                    detail.setImages(new ArrayList<String>());
                    if (images != null && !images.equals("")) {
                        detail.setImages(Arrays.asList(images.split("\\s*,\\s*")));
                    }
                }

                break;
            }
            case "rental": {
                RentalDAO dao = new RentalDAO();

                Rental rental = dao.get(detailId);
                if (rental != null) {
                    Office office = rental.getContractByContractId().getOfficeByOfficeId();
                    Profile profile = rental.getContractByContractId().getAccountByCustomerUsername().getProfileByUsername();

                    detail = new MobileDetailJSON();
                    detail.setId(rental.getId());
                    detail.setOfficeName(office.getName());
                    detail.setAddress(office.getAddress());
                    detail.setLatitude(office.getLatitude() != null ? office.getLatitude() : 0);
                    detail.setLongitude(office.getLongitude() != null ? office.getLongitude() : 0);
                    detail.setCustomerName(profile.getFullName());
                    detail.setCustomerPhone(profile.getPhone());
                    detail.setDetail(rental.getDescription());
                    detail.setDate(rental.getAssignedTime().toString());
                    detail.setStatus(rental.getStatusId());

                    List<String> list = new ArrayList<>();
                    for (RentalDetail rentalDetail : rental.getRentalDetailsById()) {
                        list.add(rentalDetail.getRentalItemByRentalItemId().getName() + " - Số lượng: " +
                                rentalDetail.getQuantity());
                    }
                    detail.setList(list);
                    String images = office.getImageUrls();
                    detail.setImages(new ArrayList<String>());
                    if (images != null && !images.equals("")) {
                        detail.setImages(Arrays.asList(images.split("\\s*,\\s*")));
                    }
                }

                break;
            }
            case "repair": {
                RepairDAO dao = new RepairDAO();

                Repair repair = dao.get(detailId);
                if (repair != null) {
                    Office office = repair.getContractByContractId().getOfficeByOfficeId();
                    Profile profile = repair.getContractByContractId().getAccountByCustomerUsername().getProfileByUsername();

                    detail = new MobileDetailJSON();
                    detail.setId(repair.getId());
                    detail.setOfficeName(office.getName());
                    detail.setAddress(office.getAddress());
                    detail.setLatitude(office.getLatitude() != null ? office.getLatitude() : 0);
                    detail.setLongitude(office.getLongitude() != null ? office.getLongitude() : 0);
                    detail.setCustomerName(profile.getFullName());
                    detail.setCustomerPhone(profile.getPhone());
                    detail.setDetail(repair.getDescription());
                    detail.setDate(repair.getAssignedTime().toString());
                    detail.setStatus(repair.getRepairStatusId());

                    List<String> list = new ArrayList<>();
                    for (RepairDetail repairDetail : repair.getRepairDetailsById()) {
                        list.add(repairDetail.getAmenityByAmenityId().getName());
                    }
                    detail.setList(list);
                    String images = office.getImageUrls();
                    detail.setImages(new ArrayList<String>());
                    if (images != null && !images.equals("")) {
                        detail.setImages(Arrays.asList(images.split("\\s*,\\s*")));
                    }
                }
                break;
            }
        }
        out.print(gson.toJson(detail));
    }


    private void countAssigned(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null && account.getRoleId() == 3) {
            String staff = account.getUsername();
            AppointmentDAO dao = new AppointmentDAO();
            int[] count = new int[3];
            count[0] = dao.countAppointment(2, staff);
            count[1] = dao.countRepair(5, staff);
            count[2] = dao.countRental(2, staff);
            out.print(gson.toJson(count));
        } else {
            out.print(gson.toJson("Error"));
        }
    }

    private void changeStatus(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException, ParseException {
        String type = request.getParameter("type");
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        String statusString = request.getParameter("status");
        String comment = request.getParameter("comment");
        int status = Integer.parseInt(statusString);
        boolean result = false;
        Date today = new Date(System.currentTimeMillis());

        switch (type) {
            case "appointment": {
                AppointmentDAO dao = new AppointmentDAO();
                Appointment appointment = dao.get(id);
                Date date = appointment.getTime();
                if (today.after(date) || today.equals(date)) {
                    if (comment != null) {
                        comment = new String(comment.getBytes("iso-8859-1"), "UTF-8");
                        result = dao.updateComment(id, status, comment);
                    } else {
                        result = dao.updateStatus(id, status);
                    }
                    out.print(gson.toJson("Success"));
                } else {
                    out.print(gson.toJson("Wrong"));
                }
                break;
            }
            case "rental": {
                RentalDAO dao = new RentalDAO();
                Rental rental = dao.get(id);
                Date date = rental.getAssignedTime();
                if (rental.getStatusId() == 2) {
                    result = dao.changeStatus(id, status);
                    out.print(gson.toJson("Success"));
                } else if (rental.getStatusId() == 5 && today.after(date) || today.equals(date)) {
                    result = dao.changeStatus(id, status);
                    out.print(gson.toJson("Success"));
                } else {
                    out.print(gson.toJson("Wrong"));
                }
                break;
            }
            case "repair": {
                RepairDAO dao = new RepairDAO();
                Repair repair = dao.get(id);
                Date date = repair.getAssignedTime();
                if (today.after(date) || today.equals(date)) {
                    result = dao.changeStatus(id, status);
                    out.print(gson.toJson("Success"));
                } else {
                    out.print(gson.toJson("Wrong"));
                }
                break;
            }
        }
    }

    private void contractReturn(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            ContractDAO dao = new ContractDAO();
            dao.changeStatus(id, 3);
            out.print(gson.toJson("OK"));
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void contractReturnAfter(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            ContractDAO dao = new ContractDAO();
            Contract contract = dao.get(id);
            dao.changeStatus(id, 3);
            long y = contract.getEndDate().getTime() + 2592000000l;
            java.sql.Date endDate = new java.sql.Date(y);
            dao.changeEndDate(id, endDate);
            out.print(gson.toJson("OK"));
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void checkContractReturn(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            ContractDAO dao = new ContractDAO();
            Contract contract = dao.get(id);
            Date date = new Date();
            long x = 7776000000l;
            if (date.getTime() < contract.getStartDate().getTime() + x) {
                out.print(gson.toJson("First"));
            } else {
                out.print(gson.toJson("Second"));
            }
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void contractExtend(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            ContractDAO dao = new ContractDAO();
            dao.changeStatus(id, 2);
            out.print(gson.toJson("Success"));
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void login(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        if (username != null && password != null) {

            AccountDAO dao = new AccountDAO();
            Account account = dao.login(username, password);

            if (account != null) {
                if (type != null && type.equals("3") && account.getRoleId() == 3) {
                    out.print(gson.toJson("Success"));
                    session.setAttribute("account", account);
                } else if (type == null && account.getRoleId() == 4) {
                    out.print(gson.toJson(account.getProfileByUsername().getFullName()));
                    session.setAttribute("account", account);
                } else {
                    out.print(gson.toJson("Wrong"));
                }
            } else {
                out.print(gson.toJson("Wrong"));
            }
        } else {
            out.print(gson.toJson("Error"));
        }
    }

    private void register(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException, ParseException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        final String username = new String(request.getParameter("username").getBytes(
                "iso-8859-1"), "UTF-8");
        String password = request.getParameter("password");
        String mail = request.getParameter("mail");
        String captcha = request.getParameter("captcha");
        String captcha3 = request.getParameter("captcha3");
        String tokenTitle = request.getParameter("title");
        String title;
        if (tokenTitle == null) {
            title = "Ông";
        } else {
            title = new String(tokenTitle.getBytes(
                    "iso-8859-1"), "UTF-8");
        }
        String fullname = new String(request.getParameter("fullname").getBytes(
                "iso-8859-1"), "UTF-8");
        String tokenCompny = request.getParameter("company");
        String company;
        if (tokenCompny == null) {
            company = null;
        } else {
            company = new String(tokenCompny.getBytes(
                    "iso-8859-1"), "UTF-8");
        }
        String phone = request.getParameter("phone");
        String tokenAddress = request.getParameter("address");
        String address;
        if (tokenAddress == null) {
            address = null;
        } else {
            address = new String(tokenAddress.getBytes(
                    "iso-8859-1"), "UTF-8");
        }
        String birthday = request.getParameter("birthday");

        boolean captchaResult = false;
        boolean captchaResult3 = false;

        if (captcha3 == null && captcha != null) {
            captchaResult = validateCaptcha("6Lcn1QkTAAAAAAVCoTxsx8kcVwHXBNKKDS8olmYd", captcha, "");
        } else if (captcha == null && captcha3 != null) {
            captchaResult3 = validateCaptcha("6LereAoTAAAAAJ2apdnszAT731OiD1-HQYbHtUV2", captcha3, "");
        }

        if (account == null && (captchaResult || captchaResult3)) {
            final Account acc = new Account();
            acc.setUsername(username);
            acc.setPassword(password);
            acc.setEmail(mail);
            acc.setRoleId(4);
            acc.setStatusId(3);

            if (birthday == null) {
                out.print(gson.toJson("Error Date"));
            } else {
                Timestamp parse = new Timestamp(Long.valueOf(birthday));

                Profile pf = new Profile();
                pf.setUsername(acc.getUsername());
                pf.setTitle(title);
                pf.setFullName(fullname);
                pf.setPhone(phone);
                pf.setCompany(company);
                pf.setAddress(address);
                pf.setBirthday(parse);

                AccountDAO accountDAO = new AccountDAO();
                boolean result = accountDAO.save(acc);

                ProfileDAO profileDAO = new ProfileDAO();
                boolean result2 = profileDAO.save(pf);

                if (result && result2) {
                    out.print(gson.toJson("Success"));
                } else {
                    out.print(gson.toJson("Error"));
                }
            }
        }
    }

    private void editProfile(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException, ParseException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        String fullName = new String(request.getParameter("fullName").getBytes(
                "iso-8859-1"), "UTF-8");
        String tokenCompny = request.getParameter("company");
        String company;
        if (tokenCompny == null) {
            company = null;
        } else {
            company = new String(tokenCompny.getBytes(
                    "iso-8859-1"), "UTF-8");
        }
        String phone = request.getParameter("phone");
        String tokenAddress = request.getParameter("address");
        String address;
        if (tokenAddress == null) {
            address = null;
        } else {
            address = new String(tokenAddress.getBytes(
                    "iso-8859-1"), "UTF-8");
        }
        String birthday = request.getParameter("birthday");

        if (account != null) {
            Timestamp parsed = new Timestamp(Long.valueOf(birthday));

            ProfileDAO profileDAO = new ProfileDAO();
            boolean result2 = profileDAO.update(account.getUsername(), fullName, company, phone, address, parsed);

            if (result2) {
                out.print(gson.toJson("Success"));
            } else {
                out.print(gson.toJson("Error"));
            }
        }
    }

    private void editPass(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String newPass = request.getParameter("newPassword");
        String reNewPass = request.getParameter("reNewPassword");

        if (account != null) {

            AccountDAO acc = new AccountDAO();
            account = acc.findByUsername(username);
            if (pass.equals(account.getPassword())) {
                if (newPass.equals(reNewPass)) {
                    boolean result2 = acc.updatePass(account.getUsername(), newPass);
                    if (result2) {
                        out.print(gson.toJson("Success"));
                    } else {
                        out.print(gson.toJson("Error"));
                    }
                } else {
                    out.print(gson.toJson("RePass Error"));
                }
            } else {
                out.print(gson.toJson("Pass Error"));
            }
        }
    }

    private void requestOffice(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        String price = request.getParameter("price");
        String area = request.getParameter("area");
        String district = new String(request.getParameter("district").getBytes(
                "iso-8859-1"), "UTF-8");

        String[] amenities = request.getParameterValues("amenityList");
        List<String> amenityItem = new ArrayList<>();

        if (amenities != null) {
            for (String amenity : amenities) {
                amenityItem.add(new String(amenity.getBytes(
                        "iso-8859-1"), "UTF-8"));
            }
        }

        if (account != null) {

            RequestOffice reOff = new RequestOffice();
            reOff.setCategoryId(1);
            reOff.setCustomerUsername(account.getUsername());
            reOff.setPrice(Integer.parseInt(price));
            reOff.setArea(Double.parseDouble(area));
            reOff.setDistrict(district);
            reOff.setCreateDate(new Timestamp((new Date()).getTime()));
            reOff.setAvailable(true);

            RequestOfficeDAO dao = new RequestOfficeDAO();
            boolean result = dao.save(reOff);

            if (result) {

                AmenityDAO amenityDAO = new AmenityDAO();
                List<Integer> amenityListInt = new ArrayList<>();
                Amenity amenity;
                for (String s : amenityItem) {
                    amenity = amenityDAO.searchAmenity(s);
                    amenityListInt.add(amenity.getId());
                }
                RequestAmenityDAO requestAmenityDAO = new RequestAmenityDAO();
                requestAmenityDAO.saveRequestAmenity(reOff.getId(), amenityListInt);

                out.print(gson.toJson("Success"));
            } else {
                out.print(gson.toJson("Error"));
            }
        }
    }


    private void checkLogin(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            String[] acc = new String[2];
            acc[0] = account.getUsername();
            acc[1] = account.getProfileByUsername().getFullName();
            out.print(gson.toJson(acc));
        } else {
            out.print(gson.toJson("Error"));
        }
    }

    private void logout(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        session.removeAttribute("account");
        out.print(gson.toJson("Success"));
    }

    private void requestAppointment(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String time = request.getParameter("time");
        String officeId = request.getParameter("officeId");
        if (account != null) {
            Appointment appointment = new Appointment();
            appointment.setCreateTime(new Timestamp((new Date()).getTime()));
            appointment.setTime(new Timestamp(Long.parseLong(time)));
            appointment.setOfficeId(Integer.parseInt(officeId));
            appointment.setCustomerUsername(account.getUsername());
            appointment.setStatusId(1);

            AppointmentDAO dao = new AppointmentDAO();
            boolean result = dao.save(appointment);
            if (result) {
                out.print(gson.toJson("Success"));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Error"));
        }
    }

    private void requestRepair(HttpServletRequest request, PrintWriter out) throws IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        //String time = request.getParameter("time");
        String contractId = request.getParameter("contractId");
        String amenities;

        String[] tokenAmenity = request.getParameterValues("amenities");
        /*if (tokenAmenity == null) {
            amenities = null;
        } else {
            amenities = new String(tokenAmenity.getBytes(
                    "iso-8859-1"), "UTF-8");
        }*/
        String phone = request.getParameter("phone");
        String description = new String(request.getParameter("description").getBytes(
                "iso-8859-1"), "UTF-8");
        if (account != null) {
            RepairDAO dao = new RepairDAO();
            Repair repair = new Repair();
            repair.setRepairStatusId(1);
            repair.setContractId(Integer.parseInt(contractId));
            repair.setCreateTime(new Timestamp((new Date()).getTime()));
            repair.setDescription(description);

            dao.save(repair);
            if (tokenAmenity != null) {
                for (String tokenA : tokenAmenity) {
                    amenities = new String(tokenA.getBytes("iso-8859-1"), "UTF-8");
                    List<String> amenityList = splitAmenity(amenities);
                    AmenityDAO amenityDAO = new AmenityDAO();
                    List<Integer> amenityListInt = new ArrayList<>();
                    Amenity amenity;
                    for (String s : amenityList) {
                        amenity = amenityDAO.searchAmenity(s);
                        if (amenity != null) {
                            amenityListInt.add(amenity.getId());
                        }
                    }
                    RepairDetailDAO repairDetailDAO = new RepairDetailDAO();
                    repairDetailDAO.saveRepairDetail(repair.getId(), amenityListInt);
                }
            }
            SMSService sms = new SMSService();
            sms.setPhone(phone);
            sms.setMessage("(ORS) Quy khach vua nhan duoc yeu cau sua chua. Hay dang nhap vao he thong va kiem tra");


            try {
                sms.send();
            } catch (IOException e) {
                e.printStackTrace();
            }
            out.print(gson.toJson("Success"));
        } else {
            out.print(gson.toJson("Error"));
        }
    }

    private List<String> splitAmenity(String amenities) {
        StringTokenizer tokenizer = new StringTokenizer(amenities, ",");
        List<String> amenityList = new ArrayList<>();
        String amenity;
        while (tokenizer.hasMoreTokens()) {
            amenity = tokenizer.nextToken();
            if (amenity != null && !amenity.equals("")) {
                amenityList.add(amenity);
            }
        }
        return amenityList;
    }

    private void requestRental(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String contractId = request.getParameter("contractId");
        String[] rentalList = request.getParameterValues("rentalList");
        List<String> rentalItem = new ArrayList<>();

        for (String rental : rentalList) {
            rentalItem.add(new String(rental.getBytes(
                    "iso-8859-1"), "UTF-8"));
        }

        String description = new String(request.getParameter("description").getBytes(
                "iso-8859-1"), "UTF-8");
        if (account != null) {
            RentalDAO dao = new RentalDAO();
            Rental rental = new Rental();
            rental.setContractId(Integer.parseInt(contractId));
            rental.setDescription(description);
            rental.setStatusId(1);
            rental.setCreateTime(new Timestamp((new Date()).getTime()));

            boolean result = dao.save(rental);
            List<RentalListJSON> rentalListItem = new ArrayList<>();

            for (String item : rentalItem) {
                RentalListJSON rentalListJSON = gson.fromJson(item, RentalListJSON.class);
                rentalListItem.add(rentalListJSON);
            }

            RentalDetailDAO rentalDetailDAO = new RentalDetailDAO();
            for (RentalListJSON json : rentalListItem) {
                RentalDetail rentalDetail = new RentalDetail();
                rentalDetail.setRentalId(rental.getId());
                rentalDetail.setRentalItemId(json.getRentalId());
                rentalDetail.setQuantity(json.getQuantity());
                rentalDetail.setUnitPrice(json.getUnitPrice());

                rentalDetailDAO.save(rentalDetail);
            }


            if (result) {
                out.print(gson.toJson("Success"));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Error"));
        }
    }


    private void getContractList(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            ContractDAO dao = new ContractDAO();
            List<ContractJSON> list = new ArrayList<>();
            for (Contract contract : dao.getContractListByCus(account.getUsername())) {
                Office office = contract.getOfficeByOfficeId();
                Profile owner = office.getAccountByOwnerUsername().getProfileByUsername();
                PaymentTerm paymentTerm = contract.getPaymentTermByPaymentTerm();
                if (contract.getStatusId() != 4) {

                    list.add(new ContractJSON(contract.getId(), office.getId(), office.getName(),
                            contract.getStartDate().getTime(), contract.getEndDate().getTime(), contract.getPaymentFee(),
                            paymentTerm.getDescription(), contract.getStatusId(), office.getAddress(),
                            office.getArea(), contract.getDeposit(), office.getCategoryByCategoryId().getDescription(),
                            owner.getFullName(), owner.getPhone(), owner.getAddress(), null));
                }
            }
            if (list.size() > 0) {
                out.print(gson.toJson(list));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void getContractHistoryList(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            ContractDAO dao = new ContractDAO();
            List<ContractJSON> list = new ArrayList<>();
            for (Contract contract : dao.getContractListByCus(account.getUsername())) {
                Office office = contract.getOfficeByOfficeId();
                Profile owner = office.getAccountByOwnerUsername().getProfileByUsername();
                PaymentTerm paymentTerm = contract.getPaymentTermByPaymentTerm();
                if (contract.getStatusId() == 4) {

                    list.add(new ContractJSON(contract.getId(), office.getId(), office.getName(),
                            contract.getStartDate().getTime(), contract.getEndDate().getTime(), contract.getPaymentFee(),
                            paymentTerm.getDescription(), contract.getStatusId(), office.getAddress(),
                            office.getArea(), contract.getDeposit(), office.getCategoryByCategoryId().getDescription(),
                            owner.getFullName(), owner.getPhone(), owner.getAddress(), null));
                }
            }
            if (list.size() > 0) {
                out.print(gson.toJson(list));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void getProfile(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            ProfileDAO dao = new ProfileDAO();
            Profile profile = (Profile) dao.getProfileByUser(account.getUsername());
            ProfileJSON json = new ProfileJSON(profile.getUsername(), profile.getTitle(), profile.getFullName(), profile.getCompany(), profile.getPhone(), profile.getAddress(), profile.getBirthday());
            out.print(gson.toJson(json));
        } else {
            out.print(gson.toJson("Error"));
        }
    }

    private void getAllOfficeRentalList(HttpServletRequest request, PrintWriter out) {
        List<RentalListJSON> list = new ArrayList<>();
        RentalItemDAO dao = new RentalItemDAO();
        for (RentalItem rentalItem : dao.findAll()) {
            list.add(new RentalListJSON(rentalItem.getId(), rentalItem.getName(), rentalItem.getDescription(),
                    rentalItem.getPrice(), rentalItem.getQuantity(), rentalItem.getImageUrl(), null, 0, null, null, null, rentalItem.getOfficeType(), null));
        }
        out.print(gson.toJson(list));
    }

    private void getRentalList(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            String contractId = request.getParameter("id");
            int id = Integer.parseInt(contractId);
            RentalDAO rentalDAO = new RentalDAO();

            List<RentalListJSON> list2 = new ArrayList<>();
            ContractDAO contractDAO = new ContractDAO();
            Contract contract = (Contract) contractDAO.getCusNameByIdContract(id);
            if (account.getUsername().equals(contract.getCustomerUsername())) {
                for (Rental rental : rentalDAO.getRentalListByContract(id)) {
                    Collection<RentalDetail> rentalDetails = rental.getRentalDetailsById();
                    List<String> listA = new ArrayList<>();
                    for (RentalDetail rentalDetail : rentalDetails) {
                        RentalItem item = rentalDetail.getRentalItemByRentalItemId();
                        listA.add(item.getName());
                    }
                    if (rental.getStatusId() == 5 || rental.getStatusId() == 2 || rental.getStatusId() == 1) {
                        list2.add(new RentalListJSON(rental.getId(), null, rental.getDescription(),
                                0, 0, null, "Đang xử lý", 0, rental.getAssignedTime(),
                                rental.getCreateTime(), contract.getOfficeByOfficeId().getName(), 0, listA));
                    }
                }
                out.print(gson.toJson(list2));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Wrong"));

        }
    }

    private void getRentalDetail(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            String rentalId = request.getParameter("id");
            int id = Integer.parseInt(rentalId);
            RentalDAO rentalDAO = new RentalDAO();
            List<RentalListJSON> list = new ArrayList<>();
            Rental rental = rentalDAO.get(id);
            for (RentalDetail rentalDetail : rental.getRentalDetailsById()) {
                RentalItem rentalItem = rentalDetail.getRentalItemByRentalItemId();
                if (rental.getStatusId() == 5 || rental.getStatusId() == 2 || rental.getStatusId() == 1) {
                    double price = rentalDetail.getUnitPrice() * rentalDetail.getQuantity();
                    list.add(new RentalListJSON(rental.getId(), rentalItem.getName(), rentalItem.getDescription(),
                            rentalDetail.getUnitPrice(), rentalDetail.getQuantity(), null,
                            rental.getRentalStatusByStatusId().getDescription(), price, null, null, null,
                            rentalItem.getOfficeType(), null));
                }
            }


            out.print(gson.toJson(list));
        } else {
            out.print(gson.toJson("Error"));
        }
    }


    private void getRentalListDone(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            String contractId = request.getParameter("id");
            int id = Integer.parseInt(contractId);
            RentalDAO rentalDAO = new RentalDAO();
            List<RentalListJSON> list = new ArrayList<>();

            for (Rental rental : rentalDAO.getRentalListByContract(id)) {
                if (rental.getStatusId() == 3) {
                    for (RentalDetail rentalDetail : rental.getRentalDetailsById()) {
                        RentalItem rentalItem = rentalDetail.getRentalItemByRentalItemId();
                        double price = rentalDetail.getUnitPrice() * rentalDetail.getQuantity();
                        list.add(new RentalListJSON(rental.getId(), rentalItem.getName(), rentalItem.getDescription(),
                                rentalDetail.getUnitPrice(), rentalDetail.getQuantity(), null,
                                rental.getRentalStatusByStatusId().getDescription(), price, null, null, null,
                                rentalItem.getOfficeType(), null));
                    }
                }
            }
            out.print(gson.toJson(list));
        }
    }

    private void getOnlyOfficeName(HttpServletRequest request, PrintWriter out) {
        String contractId = request.getParameter("id");
        int id = Integer.parseInt(contractId);
        String officeName = "";
        ContractDAO contractDAO = new ContractDAO();
        Contract contract = (Contract) contractDAO.getCusNameByIdContract(id);
        officeName = contract.getOfficeByOfficeId().getName();
        out.print(gson.toJson(officeName));
    }

    private void getRepairList(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String contractId = request.getParameter("id");
        int id = Integer.parseInt(contractId);
        if (account != null) {
            RepairDAO dao = new RepairDAO();
            List<RepairListJSON> list = new ArrayList<>();
            ContractDAO contractDAO = new ContractDAO();
            Contract contract = (Contract) contractDAO.getCusNameByIdContract(id);


            if (account.getUsername().equals(contract.getCustomerUsername())) {
                for (Repair repair : dao.getRepairListByContract(id)) {
                    Collection<RepairDetail> repairDetails = repair.getRepairDetailsById();
                    List<String> listA = new ArrayList<>();
                    for (RepairDetail repairDetail : repairDetails) {
                        Amenity amenity = repairDetail.getAmenityByAmenityId();
                        listA.add(amenity.getName());
                    }
                    if (repair.getRepairStatusId() == 1 || repair.getRepairStatusId() == 2) {
                        list.add(new RepairListJSON(repair.getId(), repair.getDescription(), repair.getCreateTime(),
                                repair.getAssignedStaff(), null, "Chờ xử lý", contract.getOfficeByOfficeId().getName(), listA));
                    } else if (repair.getRepairStatusId() == 5) {
                        list.add(new RepairListJSON(repair.getId(), repair.getDescription(), repair.getCreateTime(),
                                repair.getAssignedStaff(), repair.getAssignedTime(),
                                "Đang tiến hành xử lý", contract.getOfficeByOfficeId().getName(), listA));
                    }
                }
                if (list.size() == 0) {
                    list.add(new RepairListJSON(0, null, null, null, null,
                            null, contract.getOfficeByOfficeId().getName(), null));
                }
                out.print(gson.toJson(list));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void getRepairHistoryList(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String contractId = request.getParameter("id");
        int id = Integer.parseInt(contractId);
        if (account != null) {
            RepairDAO dao = new RepairDAO();
            List<RepairListJSON> list = new ArrayList<>();
            ContractDAO contractDAO = new ContractDAO();
            Contract contract = (Contract) contractDAO.getCusNameByIdContract(id);
            if (account.getUsername().equals(contract.getCustomerUsername())) {
                for (Repair repair : dao.getRepairListByContract(id)) {
                    Collection<RepairDetail> repairDetails = repair.getRepairDetailsById();
                    List<String> listA = new ArrayList<>();
                    for (RepairDetail repairDetail : repairDetails) {
                        Amenity amenity = repairDetail.getAmenityByAmenityId();
                        listA.add(amenity.getName());
                    }
                    if (repair.getRepairStatusId() == 3 || repair.getRepairStatusId() == 4) {
                        list.add(new RepairListJSON(repair.getId(), repair.getDescription(), repair.getCreateTime(),
                                repair.getAssignedStaff(), repair.getAssignedTime(),
                                repair.getRepairStatusByRepairStatusId().getDescription(), null, listA));
                    }
                }
                out.print(gson.toJson(list));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void getContractById(HttpServletRequest request, PrintWriter out) throws ParseException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String contractId = request.getParameter("id");
        int id = Integer.parseInt(contractId);
        ContractDAO dao = new ContractDAO();
        Contract contract = dao.get(id);
        Office office = contract.getOfficeByOfficeId();
        PaymentTerm paymentTerm = contract.getPaymentTermByPaymentTerm();
        if (account != null) {
            if (account.getUsername().equals(contract.getCustomerUsername())) {
                Profile owner = office.getAccountByOwnerUsername().getProfileByUsername();
                ContractJSON json = new ContractJSON(id, office.getId(), office.getName(),
                        contract.getStartDate().getTime(), contract.getEndDate().getTime(), contract.getPaymentFee(),
                        paymentTerm.getDescription(), contract.getStatusId(), office.getAddress(),
                        office.getArea(), contract.getDeposit(), office.getCategoryByCategoryId().getDescription(),
                        owner.getFullName(), owner.getPhone(), owner.getAddress(), contract.getImageUrl());
                out.print(gson.toJson(json));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Wrong"));
        }
    }

    private void getContractChildById(HttpServletRequest request, PrintWriter out) throws ParseException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String contractId = request.getParameter("id");
        int id = Integer.parseInt(contractId);
        ContractDAO dao = new ContractDAO();
        Contract contract = dao.get(id);
        Office office = contract.getOfficeByOfficeId();
        PaymentTerm paymentTerm = contract.getPaymentTermByPaymentTerm();
        List<Contract> test = dao.getContractListByParentContractId(contract.getId());
        if (test.size() > 0) {
            if (account != null) {
                if (account.getUsername().equals(contract.getCustomerUsername())) {
                    Profile owner = office.getAccountByOwnerUsername().getProfileByUsername();
                    ContractJSON json = new ContractJSON(id, office.getId(), office.getName(),
                            contract.getStartDate().getTime(), contract.getEndDate().getTime(), contract.getPaymentFee(),
                            paymentTerm.getDescription(), contract.getStatusId(), office.getAddress(),
                            office.getArea(), contract.getDeposit(), office.getCategoryByCategoryId().getDescription(),
                            owner.getFullName(), owner.getPhone(), owner.getAddress(), contract.getImageUrl());
                    out.print(gson.toJson(json));
                } else {
                    out.print(gson.toJson("Error"));
                }
            } else {
                out.print(gson.toJson("Wrong"));
            }
        } else {
            out.print(gson.toJson("Error"));
        }
    }

    private void getAmenityList(HttpServletRequest request, PrintWriter out) {
        AmenityDAO dao = new AmenityDAO();

        List<String> list = new ArrayList<>();
        for (Amenity amenity : dao.findAll()) {
            list.add(amenity.getName());
        }

        out.print(gson.toJson(list));
        out.flush();
    }

    private void getAmenityByOfficeId(HttpServletRequest request, PrintWriter out) {
        String officeId = request.getParameter("id");
        int id = Integer.parseInt(officeId);
        AmenityDAO dao = new AmenityDAO();
        List<String> list = new ArrayList<>();
        for (OfficeAmenity amenity : dao.getAmenityByOfficeId(id)) {
            list.add(amenity.getAmenityByAmenityId().getName());
        }
        out.print(gson.toJson(list));
    }


    private void getAmenityListWeight(HttpServletRequest request, PrintWriter out) {
        AmenityGroupDAO dao = new AmenityGroupDAO();
        List<AmenityJSON> json = new ArrayList<>();
        for (AmenityGroup amenityGroup : dao.findAll()) {
            for (Amenity amenity : amenityGroup.getAmenitiesById()) {
                json.add(new AmenityJSON(amenity.getName(), amenity.getWeight(), amenityGroup.getId()));
            }
        }

        out.print(gson.toJson(json));
        out.flush();
    }

    private void matching(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException {
        String latitudeStr = request.getParameter("latitude");
        String longitudeStr = request.getParameter("longitude");
        String priceRangeStr = request.getParameter("priceRange");

        List<OfficeListDetail> officeList = new ArrayList<>();

        try {
            double latitude = Double.parseDouble(latitudeStr);
            double longitude = Double.parseDouble(longitudeStr);
            int priceRange = Integer.parseInt(priceRangeStr);
            MatchingService service = new MatchingService();
            List<Office> matching = service.matching(latitude, longitude, priceRange);
            for (Office office : matching) {
                if (office.getStatusId() == 1) {
                    officeList.add(new OfficeListDetail(office));
                }
            }
            out.print(gson.toJson(officeList));
        } catch (Exception e) {
            e.printStackTrace();
            out.print(gson.toJson("Error"));
        }

    }

    private void getRelativeOffice(HttpServletRequest request, PrintWriter out) {
        String officeId = request.getParameter("officeId");
        int id = Integer.valueOf(officeId);
        OfficeDAO dao = new OfficeDAO();
        Office office = dao.get(id);
        int group = office.getOfficeGroupById().getOfficeGroup();
        OfficeGroupDAO groupDAO = new OfficeGroupDAO();
        List<OfficeListDetail> officeList = new ArrayList<>();
        for (OfficeGroup officeGroup : groupDAO.getOfficeList(group)) {
            Office o = officeGroup.getOfficeByOfficeId();
            if (o.getId() != id && o.getStatusId() == 1) {
                officeList.add(new OfficeListDetail(o));
            }
        }
        Collections.shuffle(officeList);
        if (officeList.size() > 3) {
            officeList = officeList.subList(0, 3);
        }
        out.print(gson.toJson(officeList));

    }

    private boolean validateCaptcha(String secret, String response, String remoteip) {
        URLConnection connection = null;
        InputStream is = null;
        String charset = java.nio.charset.StandardCharsets.UTF_8.name();

        String url = "https://www.google.com/recaptcha/api/siteverify";
        try {
            String query = String.format("secret=%s&response=%s",
                    URLEncoder.encode(secret, charset),
                    URLEncoder.encode(response, charset));

            connection = new URL(url + "?" + query).openConnection();
            is = connection.getInputStream();
            Reader in = new InputStreamReader(is);
            ResponseJSON responseJSON = gson.fromJson(in, ResponseJSON.class);
            return responseJSON.isSuccess();

        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                }

            }
        }
        return false;
    }

    private void getResultRequestOffice(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            RequestOfficeDAO requestOfficeDAO = new RequestOfficeDAO();
            OfficeDAO officeDAO = new OfficeDAO();
            List<RequestOffice> requestOfficeList = requestOfficeDAO.getAllRequestOfficeByUsername(account.getUsername());
            List<OfficeListDetail> officeList = new ArrayList<>();
            for (RequestOffice requestOffice : requestOfficeList) {
                String OfficeSuggested = requestOffice.getOfficeSuggested();
                if (OfficeSuggested != null) {
                    List<String> officeSuggest = Arrays.asList(requestOffice.getOfficeSuggested().split("\\s*,\\s*"));
                    for (String office : officeSuggest) {
                        Office office1 = officeDAO.get(Integer.parseInt(office));
                        OfficeListDetail office2 = new OfficeListDetail(office1);
                        boolean duplicate = false;
                        for (OfficeListDetail officeListDetail : officeList) {
                            if (office2.getId() == officeListDetail.getId()) {
                                duplicate = true;
                            }
                        }
                        if (duplicate == false) {
                            officeList.add(new OfficeListDetail(office1));
                        }
                    }
                }
            }
            out.print(gson.toJson(officeList));
        }
    }

    private void getRequestOffice(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {
            RequestOfficeDAO requestOfficeDAO = new RequestOfficeDAO();
            List<RequestOffice> requestOfficeList = requestOfficeDAO.getAllRequestOfficeByUsername(account.getUsername());
            List<RequestOfficeJSON> requestOfficeJSONs = new ArrayList<>();

            for (RequestOffice requestOffice : requestOfficeList) {
                requestOfficeJSONs.add(new RequestOfficeJSON(requestOffice.getId(), requestOffice.getCustomerUsername(), requestOffice.getCategoryId(),
                        requestOffice.getPrice(), requestOffice.getArea(),
                        requestOffice.getDistrict(), requestOffice.getCreateDate(), requestOffice.isAvailable()));
            }

            out.print(gson.toJson(requestOfficeJSONs));
        }
    }

    private void unsubscribeRequest(HttpServletRequest request, PrintWriter out) {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        RequestOfficeDAO requestOfficeDAO = new RequestOfficeDAO();
        RequestOffice requestOffice = requestOfficeDAO.get(requestId);

        Collection<RequestAmenity> requestAmenities = requestOffice.getRequestAmenitiesById();
        RequestAmenityDAO requestAmenityDAO = new RequestAmenityDAO();

        for (RequestAmenity requestAmenity : requestAmenities) {
            requestAmenityDAO.remove(requestAmenity);
        }


        boolean result = requestOfficeDAO.remove(requestOffice);

        if (result) {
            out.print(gson.toJson("Success"));
        } else {
            out.print(gson.toJson("Error"));
        }

    }
}
