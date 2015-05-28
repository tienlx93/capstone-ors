package controller;

import com.google.gson.Gson;
import dao.AccountDAO;
import entity.Account;
import json.AccountJSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ASUS on 5/28/2015.
 */
@WebServlet(name = "DemoController", urlPatterns = {"/demo"})
public class DemoController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Gson gson = new Gson();
        Account userAcc;

        AccountDAO dao = new AccountDAO();

        List<AccountJSON> list = new ArrayList<>();
        for (Account account : dao.findAll()) {
            AccountJSON acc = new AccountJSON(account.getUsername(),account.getPassword(),account.getEmail(),account.getRoleId());
            list.add(acc);
        }
        out.print(gson.toJson(list));
        out.flush();
    }
}
