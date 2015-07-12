package controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.*;
import entity.*;
import json.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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
        HttpSession session = request.getSession();
        //TODO: get username from session
        String username = "staff1";
        gson = new Gson();

        String action = request.getParameter("action");
        switch (action) {
            case "changeStatus":
                changeStatus(request, out, username);
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
            default:
                out.print(gson.toJson("Error"));
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        //TODO: get username from session
        String username = "staff1";
        gson = new Gson();

        String action = request.getParameter("action");
        switch (action) {
            case "getOffice":
                getOffice(request, out);
                break;
            case "getContractList":
                getContractList(request, out);
                break;
            case "getProfile":
                getProfile(request, out);
                break;
            case "getRentalList":
                getRentalList(request, out);
                break;
            case "getAmenityList":
                getAmenityList(request, out);
                break;
            case "getRepairList":
                getRepairList(request, out);
                break;
            case "getAllOffice":
                getAllOffice(request, out);
                break;
            case "listMobile":
                listMobile(request, out, username);
                break;
            case "detailMobile":
                detailMobile(request, out, username);
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
            case "amenity":
                getAmenityList(request, out);
                break;
            case "officeName":
                getOfficeName(request, out);
                break;
            case "getAllOfficeRentalList":
                getAllOfficeRentalList(request, out);
                break;
            default:
                out.print(gson.toJson("Error"));
        }

        out.flush();
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

    private void listMobile(HttpServletRequest request, PrintWriter out, String username) {
        String type = request.getParameter("type");
        List<MobileListJSON> list = new ArrayList<>();
        switch (type) {
            case "appointment": {
                AppointmentDAO dao = new AppointmentDAO();

                for (Appointment appointment : dao.findAll()) {
                    Office office = appointment.getOfficeByOfficeId();
                    Profile profile = appointment.getAccountByCustomerUsername().getProfileByUsername();

                    list.add(new MobileListJSON(appointment.getId(), office.getName(), office.getAddress(),
                            profile.getFullName(), appointment.getTime().toString(), appointment.getStatusId()));
                }

                break;
            }
            case "rental": {
                RentalDAO dao = new RentalDAO();

                for (Rental rental : dao.getRentalListByStaff(username)) {
                    Office office = rental.getContractByContractId().getOfficeByOfficeId();

                    list.add(new MobileListJSON(rental.getId(), office.getName(), office.getAddress(),
                            rental.getDescription(), rental.getCreateTime().toString(), rental.getStatusId()));
                }

                break;
            }
            case "repair": {
                RepairDAO dao = new RepairDAO();

                for (Repair repair : dao.getRepairListByStaff(username)) {
                    Office office = repair.getContractByContractId().getOfficeByOfficeId();

                    list.add(new MobileListJSON(repair.getId(), office.getName(), office.getAddress(),
                            repair.getDescription(), repair.getCreateTime().toString(), repair.getRepairStatusId()));
                }
                break;
            }
        }
        out.print(gson.toJson(list));
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

    ;

    private void detailMobile(HttpServletRequest request, PrintWriter out, String username) {
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
                    detail.setDetail("");
                    detail.setDate(appointment.getTime().toString());
                    detail.setStatus(appointment.getStatusId());
                    detail.setList(new ArrayList<String>());
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
                    detail.setDetail(rental.getDescription());
                    detail.setDate(rental.getCreateTime().toString());
                    detail.setStatus(rental.getStatusId());

                    List<String> list = new ArrayList<>();
                    for (RentalDetail rentalDetail : rental.getRentalDetailsById()) {
                        list.add(rentalDetail.getRentalItemByRentalItemId().getName() + " - Số lượng: " +
                                rentalDetail.getQuantity());
                    }
                    detail.setList(list);
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
                    detail.setDetail(repair.getDescription());
                    detail.setDate(repair.getCreateTime().toString());
                    detail.setStatus(repair.getRepairStatusId());

                    List<String> list = new ArrayList<>();
                    for (RepairDetail repairDetail : repair.getRepairDetailsById()) {
                        list.add(repairDetail.getAmenityByAmenityId().getName());
                    }
                    detail.setList(list);
                }
                break;
            }
        }
        out.print(gson.toJson(detail));
    }

    private void changeStatus(HttpServletRequest request, PrintWriter out, String username) {
        String type = request.getParameter("type");
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        String statusString = request.getParameter("status");
        int status = Integer.parseInt(statusString);
        boolean result = false;
        switch (type) {
            case "appointment": {
                AppointmentDAO dao = new AppointmentDAO();
                result = dao.changeStatus(id, status);
                break;
            }
            case "rental": {
                RentalDAO dao = new RentalDAO();
                result = dao.changeStatus(id, status);
                break;
            }
            case "repair": {
                RepairDAO dao = new RepairDAO();
                result = dao.changeStatus(id, status);
                break;
            }
        }
        if (result) {
            out.print(gson.toJson("Success"));
        } else {
            out.print(gson.toJson("Error"));
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
                if (type != null && type.equals("3")) {
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
        String username = new String(request.getParameter("username").getBytes(
                "iso-8859-1"), "UTF-8");
        String password = request.getParameter("password");
        String mail = request.getParameter("mail");
        String title = new String(request.getParameter("title").getBytes(
                "iso-8859-1"), "UTF-8");
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

        if (account == null) {
            Account acc = new Account();
            acc.setUsername(username);
            acc.setPassword(password);
            acc.setEmail(mail);
            acc.setRoleId(4);
            acc.setStatusId(1);
            AccountDAO accountDAO = new AccountDAO();
            boolean result = accountDAO.save(acc);

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date parsed = format.parse(birthday);


            Profile pf = new Profile();
            pf.setUsername(acc.getUsername());
            pf.setTitle(title);
            pf.setFullName(fullname);
            pf.setPhone(phone);
            pf.setCompany(company);
            pf.setAddress(address);
            pf.setBirthday(new Timestamp(parsed.getTime()));


            ProfileDAO profileDAO = new ProfileDAO();
            boolean result2 = profileDAO.save(pf);

            if (result && result2) {
                out.print(gson.toJson("Success"));
            } else {
                out.print(gson.toJson("Error"));
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

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date parsed = format.parse(birthday);

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

        String pass = request.getParameter("password");
        String newPass = request.getParameter("newPassword");
        String reNewPass = request.getParameter("reNewPassword");

        if (account != null) {

            AccountDAO acc = new AccountDAO();
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

        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String area = request.getParameter("area");
        String district = new String(request.getParameter("district").getBytes(
                "iso-8859-1"), "UTF-8");
        String amenities = request.getParameter("amenityList");

        if (account != null) {

            RequestOffice reOff = new RequestOffice();
            reOff.setCustomerUsername(account.getUsername());
            reOff.setCategoryId(Integer.parseInt(category));
            reOff.setPrice(Integer.parseInt(price));
            reOff.setArea(Double.parseDouble(area));
            reOff.setDistrict(district);
            reOff.setCreateDate(new Timestamp((new Date()).getTime()));
            reOff.setAvailable(true);

            RequestOfficeDAO dao = new RequestOfficeDAO();
            boolean result = dao.save(reOff);

            if (result) {

                List<String> amenityList = saveAmenities(amenities);
                AmenityDAO amenityDAO = new AmenityDAO();
                List<Integer> amenityListInt = new ArrayList<>();
                Amenity amenity;
                for (String s : amenityList) {
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

    private void requestRepair(HttpServletRequest request, PrintWriter out) throws UnsupportedEncodingException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String time = request.getParameter("time");
        String contractId = request.getParameter("contractId");
        String amenities = new String(request.getParameter("amenities").getBytes(
                "iso-8859-1"), "UTF-8");
        String description = new String(request.getParameter("description").getBytes(
                "iso-8859-1"), "UTF-8");
        if (account != null) {
            RepairDAO dao = new RepairDAO();
            Repair repair = new Repair();
            repair.setRepairStatusId(1);
            repair.setContractId(Integer.parseInt(contractId));
            repair.setCreateTime(new Timestamp((new Date()).getTime()));
            repair.setDescription(description);


            boolean result = dao.save(repair);

            if (result) {
                List<String> amenityList = saveAmenities(amenities);
                AmenityDAO amenityDAO = new AmenityDAO();
                List<Integer> amenityListInt = new ArrayList<>();
                Amenity amenity;
                for (String s : amenityList) {
                    amenity = amenityDAO.searchAmenity(s);
                    amenityListInt.add(amenity.getId());
                }
                RepairDetailDAO repairDetailDAO = new RepairDetailDAO();
                repairDetailDAO.saveRepairDetail(repair.getId(), amenityListInt);
                out.print(gson.toJson("Success"));
            } else {
                out.print(gson.toJson("Error"));
            }
        } else {
            out.print(gson.toJson("Error"));
        }
    }

    private List<String> saveAmenities(String amenities) {
        StringTokenizer tokenizer = new StringTokenizer(amenities, ",");
        List<String> amenityList = new ArrayList<>();
        while (tokenizer.hasMoreTokens()) {
            amenityList.add(tokenizer.nextToken());
        }
        AmenityDAO amenityDAO = new AmenityDAO();
        RequestAmenityDAO dao = new RequestAmenityDAO();
        amenityDAO.addAmenities(amenityList);
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

            RentalDetailDAO rentalDatailDao = new RentalDetailDAO();
            for (RentalListJSON json : rentalListItem) {
                RentalDetail rentalDetail = new RentalDetail();
                rentalDetail.setRentalId(rental.getId());
                rentalDetail.setRentalItemId(json.getRentalId());
                rentalDetail.setQuantity(json.getQuantity());
                rentalDetail.setUnitPrice(json.getUnitPrice());

                rentalDatailDao.save(rentalDetail);
            }


            if (result) {
//
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
                PaymentTerm paymentTerm = contract.getPaymentTermByPaymentTerm();
                list.add(new ContractJSON(contract.getId(), office.getId(), office.getName(),
                        contract.getStartDate(), contract.getEndDate(), contract.getPaymentFee(), paymentTerm.getDescription()));
            }
            out.print(gson.toJson(list));
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
        }
    }

    private void getAllOfficeRentalList(HttpServletRequest request, PrintWriter out) {
        List<RentalListJSON> list = new ArrayList<>();
        RentalItemDAO dao = new RentalItemDAO();
        for (RentalItem rentalItem : dao.findAll()) {
            list.add(new RentalListJSON(rentalItem.getId(), rentalItem.getName(), rentalItem.getDescription(),
                    rentalItem.getPrice(), rentalItem.getQuantity(), rentalItem.getImageUrl()));
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
            List<RentalListJSON> list = new ArrayList<>();

            for (Rental rental : rentalDAO.getRentalListByContract(id)) {
                for (RentalDetail rentalDetail : rental.getRentalDetailsById()) {
                    RentalItem rentalItem = rentalDetail.getRentalItemByRentalItemId();
                    list.add(new RentalListJSON(rental.getId(), rentalItem.getName(), rentalItem.getDescription(),
                            rentalDetail.getUnitPrice(), rentalDetail.getQuantity(), null));
                }
            }
            out.print(gson.toJson(list));
        }
    }

    private void getRepairList(HttpServletRequest request, PrintWriter out) {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String contractId = request.getParameter("id");
        int id = Integer.parseInt(contractId);
        if (account != null) {
            RepairDAO dao = new RepairDAO();
            List<RepairListJSON> list = new ArrayList<>();
            for (Repair repair : dao.getRepairListByContract(id)) {
                list.add(new RepairListJSON(repair.getId(), repair.getDescription(), repair.getCreateTime(),
                        repair.getAssignedStaff(), repair.getAssignedTime(), repair.getRepairStatusByRepairStatusId().getDescription()));
            }
            out.print(gson.toJson(list));
        }
    }

    private void getContractById(HttpServletRequest request, PrintWriter out) throws ParseException {
        String contractId = request.getParameter("id");
        int id = Integer.parseInt(contractId);
        ContractDAO dao = new ContractDAO();
        Contract contract = dao.get(id);
        Office office = contract.getOfficeByOfficeId();
        PaymentTerm paymentTerm = contract.getPaymentTermByPaymentTerm();
        ContractJSON json = new ContractJSON(id, office.getId(), office.getName(),
                contract.getStartDate(), contract.getEndDate(), contract.getPaymentFee(), paymentTerm.getDescription());

        out.print(gson.toJson(json));
    }

    private void getAmenityList(HttpServletRequest request, PrintWriter out) {
        Gson gson = new Gson();

        AmenityDAO dao = new AmenityDAO();

        List<String> list = new ArrayList<>();
        for (Amenity amenity : dao.findAll()) {
            list.add(amenity.getName());
        }
        request.setAttribute("amenityList", list);
        out.print(gson.toJson(list));
        out.flush();
    }
}


