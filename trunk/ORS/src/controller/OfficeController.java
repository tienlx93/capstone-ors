package controller;

import dao.AmenityDAO;
import dao.CategoryDAO;
import dao.OfficeDAO;
import dao.PriceTermDAO;
import entity.Amenity;
import entity.Category;
import entity.Office;
import entity.PriceTerm;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by ASUS on 6/2/2015.
 */
@WebServlet(name = "OfficeController", urlPatterns = {"/admin/office"})
public class OfficeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equals("save")) {
            OfficeDAO dao = new OfficeDAO();
            Office office = new Office();
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String priceTerm = request.getParameter("priceTerm");
            String floor = request.getParameter("floor");
            String area = request.getParameter("area");
            String imageUrls = request.getParameter("imageUrls");

            office.setStatusId(1);
            office.setName(name);
            office.setAddress(address);
            office.setCategoryId(Integer.parseInt(category));
            office.setDescription(description);
            office.setPrice(Long.valueOf(price));
            office.setPriceTerm(Integer.parseInt(priceTerm));
            office.setFloorNumber(Integer.parseInt(floor));
            office.setArea(Double.parseDouble(area));
            office.setImageUrls(imageUrls);
            office.setManagerAccount("manager1");

            dao.save(office);
            response.sendRedirect("/admin/office");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeDAO dao = new OfficeDAO();
        String action = request.getParameter("action");
        RequestDispatcher rd;
        if (action == null) {
            List<Office> list = dao.findAll();
            request.setAttribute("data", list);
            rd = request.getRequestDispatcher("/WEB-INF/admin/office/viewOffice.jsp");
            rd.forward(request, response);
        } else if (action.equals("new")) {
            //Office office = dao.get(4);
            Office office = new Office();
            request.setAttribute("office", office);

            PriceTermDAO ptDao = new PriceTermDAO();
            List<PriceTerm> priceTermList = ptDao.findAll();
            request.setAttribute("priceTermList", priceTermList);

            CategoryDAO cDao = new CategoryDAO();
            List<Category> categoryList = cDao.findAll();
            request.setAttribute("categoryList", categoryList);

            AmenityDAO aDao = new AmenityDAO();
            List<Amenity> amenityList = aDao.findAll();
            request.setAttribute("amenityList", amenityList);

            rd = request.getRequestDispatcher("/WEB-INF/admin/office/newOffice.jsp");
            rd.forward(request, response);
        }

    }
}
