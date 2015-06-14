package controller;

import com.google.gson.Gson;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
            case "getAllOffice":
                getAllOffice(request, out);
                break;
            case "listMobile":
                listMobile(request, out, username);
                break;
            case "detailMobile":
                detailMobile(request, out, username);
                break;
            default:
                out.print(gson.toJson("Error"));
        }

        out.flush();
    }

    private void getOffice(HttpServletRequest request, PrintWriter out) {
        String officeId = request.getParameter("officeId");
        if (officeId != null) {
            int id = Integer.parseInt(officeId);
            Office office;
            OfficeDAO dao = new OfficeDAO();
            office = dao.get(id);
            OfficeJSON json = new OfficeJSON(office);
            out.print(gson.toJson(json));

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null) {

            AccountDAO dao = new AccountDAO();
            if (dao.isValid(username, password)) {
                out.print(gson.toJson("Success"));
            } else {
                out.print(gson.toJson("Wrong"));
            }
        } else {
            out.print(gson.toJson("Error"));
        }
    }
}


