package controller;

import dao.RentalItemDAO;
import entity.RentalItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Thành on 10/06/2015.
 */
@WebServlet(name = "RentalItemController", urlPatterns = "/admin/rentalItem")
public class RentalItemController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action.equals("editing")) {
            RentalItemDAO dao = new RentalItemDAO();
            dao.update(Integer.parseInt(request.getParameter("id")), request.getParameter("name"),
                    request.getParameter("description"), Double.parseDouble(request.getParameter("price")),
                    Integer.parseInt(request.getParameter("quantity")), request.getParameter("imageUrl"));
            response.sendRedirect("/admin/rentalItem");
        } else if (action.equals("save")) {
            RentalItemDAO dao = new RentalItemDAO();
            RentalItem rtItem = new RentalItem();
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");
            String imageUrl = request.getParameter("imageUrl");

            rtItem.setName(name);
            rtItem.setDescription(description);
            rtItem.setPrice(Double.parseDouble(price));
            rtItem.setQuantity(Integer.parseInt(quantity));
            rtItem.setImageUrl(imageUrl);

            dao.save(rtItem);

            response.sendRedirect("/admin/rentalItem");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RentalItemDAO dao = new RentalItemDAO();
        String action = request.getParameter("action");
        if (action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/rental/rentalItem.jsp");
            rd.forward(request, response);
        } else if (action.equals("edit")) {
            request.setAttribute("info", dao.get(Integer.parseInt(request.getParameter("id"))));
            request.getRequestDispatcher("/WEB-INF/admin/rental/rentalItemDetail.jsp").forward(request, response);

        } else if (action.equals("new")) {
            RentalItem rtItem = new RentalItem();
            request.setAttribute("rentalItem", rtItem);
            request.getRequestDispatcher("/WEB-INF/admin/rental/newRentalItem.jsp").forward(request, response);
        }
    }
}
