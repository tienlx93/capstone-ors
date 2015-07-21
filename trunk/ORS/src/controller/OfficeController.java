package controller;

import dao.*;
import entity.*;
import service.ClusteringService;
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
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

/**
 * Created by ASUS on 6/2/2015.
 */
@WebServlet(name = "OfficeController", urlPatterns = {"/admin/office"})
public class OfficeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        OfficeDAO dao = new OfficeDAO();
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String priceTerm = request.getParameter("priceTerm");
        String floor = request.getParameter("floor");
        String area = request.getParameter("area");
        String imageUrls = request.getParameter("imageUrls");
        String amenities = request.getParameter("amenityList");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String district = request.getParameter("district");
        String city = request.getParameter("city");
        if (action.equals("save")) {
            Office office = new Office();

            office.setStatusId(1);
            office.setName(name);
            office.setAddress(address);
            office.setCategoryId(Integer.parseInt(category));
            office.setDescription(description);
            office.setCreateDate(new Timestamp((new Date()).getTime()));
            if (!price.equals("")) {
                office.setPrice(Long.valueOf(price));
            }
            office.setPriceTerm(Integer.parseInt(priceTerm));
            if (!floor.equals("")) {
                office.setFloorNumber(Integer.parseInt(floor));
            }
            office.setArea(Double.parseDouble(area));
            office.setImageUrls(imageUrls);
            office.setCity(city);
            office.setDistrict(district);
            office.setLatitude(Double.valueOf(latitude));
            office.setLongitude(Double.valueOf(longitude));

            if (dao.save(office)) {
                List<String> amenityList = saveAmenities(amenities);
                AmenityDAO amenityDAO = new AmenityDAO();
                List<Integer> amenityListInt = new ArrayList<>();
                Amenity amenity;
                for (String s : amenityList) {
                    amenity = amenityDAO.searchAmenity(s);
                    amenityListInt.add(amenity.getId());
                }
                OfficeAmenityDAO officeAmenityDAO = new OfficeAmenityDAO();
                officeAmenityDAO.saveOfficeAmenity(office.getId(), amenityListInt);
                ClusteringService service = new ClusteringService();
                service.doCluster();
                response.sendRedirect("/admin/office");
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/office/newOffice.jsp");
                rd.forward(request, response);
            }
        } else if (action.equals("update")) {


            String id = request.getParameter("id");
            Office office = dao.get(Integer.parseInt(id));

            office.setStatusId(1);
            office.setName(name);
            office.setAddress(address);
            office.setCategoryId(Integer.parseInt(category));
            office.setDescription(description);
            office.setCreateDate(new Timestamp((new Date()).getTime()));
            if (!price.equals("")) {
                office.setPrice(Long.valueOf(price));
            }
            office.setPriceTerm(Integer.parseInt(priceTerm));
            if (!floor.equals("")) {
                office.setFloorNumber(Integer.parseInt(floor));
            }
            office.setArea(Double.parseDouble(area));
            office.setImageUrls(imageUrls);
            office.setCity(city);
            office.setDistrict(district);
            office.setLatitude(Double.valueOf(latitude));
            office.setLongitude(Double.valueOf(longitude));

            if(dao.update(Integer.parseInt(id), office)) {
                List<String> amenityList = saveAmenities(amenities);
                AmenityDAO amenityDAO = new AmenityDAO();
                List<Integer> amenityListInt = new ArrayList<>();
                Amenity amenity;
                for (String s : amenityList) {
                    amenity = amenityDAO.searchAmenity(s);
                    amenityListInt.add(amenity.getId());
                }
                OfficeAmenityDAO officeAmenityDAO = new OfficeAmenityDAO();
                officeAmenityDAO.removeByOffice(office.getId());
                officeAmenityDAO.saveOfficeAmenity(office.getId(), amenityListInt);
                ClusteringService service = new ClusteringService();
                service.doCluster();

                response.sendRedirect("/admin/office");
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/office/editOffice.jsp");
                rd.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeDAO dao = new OfficeDAO();
        String action = request.getParameter("action");
        RequestDispatcher rd;

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        if (account != null && (account.getRoleId() == 2 || account.getRoleId() == 3)) {

            if (action == null) {
                int pageCount = dao.getPageCount(ConstantService.PAGE_SIZE);
                request.setAttribute("pageCount", pageCount);

                List<Office> list = dao.getOfficeByPage(0, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list);
                rd = request.getRequestDispatcher("/WEB-INF/admin/office/viewOffice.jsp");
                rd.forward(request, response);
            } else if (action.equals("new")) {
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
            } else if (action.equals("edit")) {

                PriceTermDAO ptDao = new PriceTermDAO();
                List<PriceTerm> priceTermList = ptDao.findAll();
                request.setAttribute("priceTermList", priceTermList);

                CategoryDAO cDao = new CategoryDAO();
                List<Category> categoryList = cDao.findAll();
                request.setAttribute("categoryList", categoryList);


                int id = Integer.parseInt(request.getParameter("id"));
                Office office = dao.get(id);
                request.setAttribute("office", office);
                List<String> amenityList = new ArrayList<>();
                for (OfficeAmenity officeAmenity : office.getOfficeAmenitiesById()) {
                    String name = officeAmenity.getAmenityByAmenityId().getName();
                    amenityList.add(name);
                }
                request.setAttribute("amenityList", amenityList);

                rd = request.getRequestDispatcher("/WEB-INF/admin/office/editOffice.jsp");
                rd.forward(request, response);
            } else if (action.equals("page")) {
                String startPage = request.getParameter("startPage");
                int page = Integer.parseInt(startPage);
                int startItem = (page - 1) * ConstantService.PAGE_SIZE;
                List<Office> list = dao.getOfficeByPage(startItem, ConstantService.PAGE_SIZE);
                request.setAttribute("data", list);
                rd = request.getRequestDispatcher("/WEB-INF/partial/officeListItem.jsp");
                rd.forward(request, response);
            }
        } else {
            response.sendRedirect("/admin");
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
