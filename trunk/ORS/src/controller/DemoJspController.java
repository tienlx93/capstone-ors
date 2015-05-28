package controller;

import dao.AccountDAO;
import entity.Account;
import json.AccountJSON;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ASUS on 5/28/2015.
 */
@WebServlet(name = "DemoJspController", urlPatterns = {"/demo2"})
public class DemoJspController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        List<Account> list = dao.findAll();
        request.setAttribute("data", list);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/demo.jsp");
        rd.forward(request, response);
    }
}
