package controller;

//import com.itextpdf.text.*;
//import com.itextpdf.text.pdf.BaseFont;
//import com.itextpdf.text.pdf.PdfWriter;
import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.rtf.RtfWriter2;
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
import java.io.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.*;
import java.util.*;
import java.awt.Desktop;
import java.util.List;
import java.util.logging.Level;

/**
 * Created by xps on 6/2/2015.
 */
@WebServlet(name = "ContractController", urlPatterns = {"/admin/contract"})
public class ContractController extends HttpServlet {
    public static File fontFile = new File("fonts/arialuni.ttf");

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
                    officeChildren.setOwnerUsername(officeParent.getOwnerUsername());
                    officeChildren.setCommission(officeParent.getCommission());
//                    officeChildren.setOwnerPhone(officeParent.getOwnerPhone());
//                    officeChildren.setOwnerAddress(officeParent.getOwnerAddress());
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
                String depositPaidDay = request.getParameter("depositPaidDay");
                String firstPaymentPaidDay = request.getParameter("firstPaymentPaidDay");
                String paymentPaidDay = request.getParameter("paymentPaidDay");
                String additionalCharge = request.getParameter("additionalCharge");


                if (deposit.equals("")) {
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

                contract.setDepositPaidDay(Integer.parseInt(depositPaidDay));
                contract.setFirstPaymentPaidDay(Integer.parseInt(firstPaymentPaidDay));
                contract.setPaymentPaidDay(Integer.parseInt(paymentPaidDay));
                contract.setAdditionalCharge(Integer.parseInt(additionalCharge));
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
                newContract.setFirstPaymentPaidDay(contract.getFirstPaymentPaidDay());
                newContract.setPaymentPaidDay(contract.getPaymentPaidDay());
                newContract.setDepositPaidDay(contract.getDepositPaidDay());
                newContract.setAdditionalCharge(contract.getAdditionalCharge());
                try {
                    String reformattedEnd = myFormat.format(fromUser.parse(endDate));
                    newContract.setEndDate(Date.valueOf(reformattedEnd));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                switch (button) {
                    case "confirm":
                        contract.setStatusId(1);
                        dao.updateContract(id, contract);
                        dao.save(newContract);
                        break;
                    case "cancel":
                        dao.changeStatus(id, 1);
                        break;
                }
                response.sendRedirect("/admin/contract?action=extend");
                break;
            }
            case "editReturn": {
                int id = Integer.parseInt(request.getParameter("id"));
                ContractDAO dao = new ContractDAO();
                switch (button) {
                    case "confirm":
//                        dao.changeStatus(id, 4);
//                        String returnMoney = request.getParameter("returnMoney");
                        String returnDeposit = request.getParameter("returnDeposit") != null ? request.getParameter("returnDeposit") : "0";
                        // Update area for office parent when contract has been confirmed to expire
                        Contract contract = dao.get(id);

                        // add cancel date when return
                        contract.setCancelDate(new Date((new java.util.Date()).getTime()));
                        contract.setStatusId(4);
                        Long deposit = contract.getDeposit() - Long.parseLong(returnDeposit);
                        contract.setDeposit(deposit);
//                        contract.setCancelFee(Long.getLong(returnMoney));

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
                response.sendRedirect("/admin/contract?action=return");
                break;
            }
            case "update": {
                String id = request.getParameter("contractId");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                String paymentTerm = request.getParameter("paymentTerm");
                String paymentFee = request.getParameter("paymentFee");
                String deposit = request.getParameter("deposit");
                String depositPaidDay = request.getParameter("depositPaidDay");
                String firstPaymentPaidDay = request.getParameter("firstPaymentPaidDay");
                String paymentPaidDay = request.getParameter("paymentPaidDay");
                String additionalCharge = request.getParameter("additionalCharge");

                if (deposit.equals("")) {
                    deposit = "0";
                }
                ContractDAO contractDAO = new ContractDAO();
                Contract contract = contractDAO.get(Integer.parseInt(id));
                contract.setStartDate(Date.valueOf(startDate));
                contract.setEndDate(Date.valueOf(endDate));
                contract.setPaymentTerm(Integer.parseInt(paymentTerm));
                contract.setPaymentFee(Integer.parseInt(paymentFee));
                contract.setDeposit(Long.parseLong(deposit));
                contract.setDepositPaidDay(Integer.parseInt(depositPaidDay));
                contract.setFirstPaymentPaidDay(Integer.parseInt(firstPaymentPaidDay));
                contract.setPaymentPaidDay(Integer.parseInt(paymentPaidDay));
                contract.setAdditionalCharge(Integer.parseInt(additionalCharge));

                contractDAO.updateContract(contract.getId(), contract);
                response.sendRedirect("/admin/contract?action=editing&id=" + id);
                break;
            }

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
        if (account != null && (account.getRoleId() == 5)) {
            if (action == null) {
                int pageCount = (int) Math.ceil((double) dao.countContractByOfficeOwner(account.getUsername()) / ConstantService.PAGE_SIZE);
                request.setAttribute("pageCount", pageCount);
                List<Contract> list1 = dao.getContractByOfficeOwner(0, ConstantService.PAGE_SIZE, account.getUsername());
                request.setAttribute("data", list1);
                rd = request.getRequestDispatcher("/WEB-INF/admin/contract/viewContract.jsp");
                rd.forward(request, response);
            } else if (action.equals("page")) {
                String startPage = request.getParameter("startPage");
                int page = Integer.parseInt(startPage);
                int startItem = (page - 1) * ConstantService.PAGE_SIZE;
                List<Contract> list1 = dao.getContractByOfficeOwner(startItem, ConstantService.PAGE_SIZE, account.getUsername());
                request.setAttribute("data", list1);
                rd = request.getRequestDispatcher("/WEB-INF/partial/contractListItem.jsp");
                rd.forward(request, response);
            } else {
                switch (action) {
                    case "editing": {
                        String ids = request.getParameter("id");

                        Contract contract1 = dao.get(Integer.parseInt(ids));
                        request.setAttribute("contract", contract1);

                        request.setAttribute("paymentTermList", paymentTermList);

                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/contractDetail.jsp");
                        rd.forward(request, response);
                        break;
                    }
                }
            }
        }
        else if (account != null && (account.getRoleId() == 2)) {
            if (action == null) {
                int pageCount = (int) Math.ceil((double) dao.countContractByStatus(1) / ConstantService.PAGE_SIZE);
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
                    case "new": {
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
                    }
                    case "edit": {
                        String id = request.getParameter("id");

                        Contract contract = dao.get(Integer.parseInt(id));
                        request.setAttribute("contract", contract);

                        request.setAttribute("paymentTermList", paymentTermList);

                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/editContract.jsp");
                        rd.forward(request, response);
                        break;
                    }
                    case "editing": {
                        String ids = request.getParameter("id");

                        Contract contract1 = dao.get(Integer.parseInt(ids));
                        request.setAttribute("contract", contract1);

                        request.setAttribute("paymentTermList", paymentTermList);

                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/contractDetail.jsp");
                        rd.forward(request, response);
                        break;
                    }
                    case "return": {
                        request.setAttribute("titleName", "huy");
                        rd = request.getRequestDispatcher("/WEB-INF/admin/contract/request.jsp");
                        rd.forward(request, response);
                        break;
                    }
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
                    case "export":
                        String id = request.getParameter("id");

                        Contract contract = dao.get(Integer.parseInt(id));

                        try {
                            String path = ExportPDF(contract);
                            response.setContentType("text/rtf");
                            response.setHeader("Content-disposition", "attachment; filename=" + "Hopdong_" + id + ".rtf");
                            File pdfFile = new File(path);
                            FileInputStream fileInputStream = new FileInputStream(pdfFile);
                            response.setContentLength((int) pdfFile.length());
                            OutputStream responseOutputStream = response.getOutputStream();
                            int bytes;
                            while ((bytes = fileInputStream.read()) != -1) {
                                responseOutputStream.write(bytes);
                            }

//                            String pdfFile = "E:/HelloWorld.pdf";
//                            File file = new File(pdfFile);
//                            if (pdfFile.toString().endsWith(".pdf")) {
//                                Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + pdfFile);
//                            } else {
//                                //For cross platform use
//                                Desktop desktop = Desktop.getDesktop();
//                                desktop.open(file);
//                            }

                            //response.sendRedirect("/admin/contract");
                        } catch (DocumentException e) {
                            e.printStackTrace();
                        }
                        break;

                }
            }

        } else {
            response.sendRedirect("/admin");
        }
    }

    public String ExportPDF(Contract contract) throws IOException, DocumentException {
        Document document = new Document();

        HashMap<Integer, String> paymentTerm = new HashMap<Integer, String>();
        paymentTerm.put(0, "không");
        paymentTerm.put(1, "một");
        paymentTerm.put(2, "hai");
        paymentTerm.put(3, "ba");
        paymentTerm.put(4, "bốn");
        paymentTerm.put(5, "năm");
        paymentTerm.put(6, "sáu");
        paymentTerm.put(7, "bảy");
        paymentTerm.put(8, "tám");
        paymentTerm.put(9, "chín");
        paymentTerm.put(10, "mười");
        paymentTerm.put(11, "mười một");
        paymentTerm.put(12, "mười hai");
        paymentTerm.put(13, "mười ba");
        paymentTerm.put(14, "mười bốn");
        paymentTerm.put(15, "mười năm");
        paymentTerm.put(16, "mười sáu");
        paymentTerm.put(17, "mười bảy");
        paymentTerm.put(18, "mười tám");
        paymentTerm.put(19, "mười chín");
        paymentTerm.put(20, "hai mươi");
        paymentTerm.put(21, "hai mươi một");
        paymentTerm.put(22, "hai mươi hai");
        paymentTerm.put(23, "hai mươi ba");
        paymentTerm.put(24, "hai mươi bốn");
        paymentTerm.put(25, "hai mươi năm");
        paymentTerm.put(26, "hai mươi sáu");
        paymentTerm.put(27, "hai mươi bảy");
        paymentTerm.put(28, "hai mươi tám");
        paymentTerm.put(29, "hai mươi chín");
        paymentTerm.put(30, "ba mươi");
        paymentTerm.put(31, "ba mươi mốt");

//        BaseFont base = BaseFont.createFont("/fonts/vuArial.ttf", BaseFont.WINANSI);
        BaseFont base = BaseFont.createFont("fonts/vuArial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(base, 10, Font.NORMAL);
        Font boldFont = new Font(base, 10, Font.BOLD);
        Font italicFont = new Font(base, 10, Font.ITALIC);

        Calendar cal = Calendar.getInstance();
        int day = cal.get(Calendar.DAY_OF_MONTH);
        int month = cal.get(Calendar.MONTH) + 1;
        int year = cal.get(Calendar.YEAR);

        String dayStr = String.valueOf(day);
        String monthStr = String.valueOf(month);
        String yearStr = String.valueOf(year);
        File output = null;
        try {
            String path = getServletContext().getRealPath("") + File.separator + "contract";
            File uploadDir = new File(path);
            if (!uploadDir.exists()) {
                boolean mkdir = uploadDir.mkdir();
            }
            output = new File(path + File.separator + "Hopdong " + contract.getId() + ".rtf");
            RtfWriter2.getInstance(document, new FileOutputStream(output));

            document.open();
            Paragraph paragraphEmpty = new Paragraph();
            paragraphEmpty.setSpacingBefore(10);

            Paragraph title = new Paragraph("HỢP ĐỒNG CHO THUÊ VĂN PHÒNG", boldFont);
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(5);

            Paragraph subTitle = new Paragraph("(Số: ……………./HĐTVP)", italicFont);
            subTitle.setAlignment((Element.ALIGN_CENTER));
            subTitle.setSpacingAfter(25);

            document.add(title);
            document.add(subTitle);
            document.add(new Paragraph("Hôm nay, ngày " + dayStr + " tháng " + monthStr + " năm " + yearStr + ", Tại " + contract.getOfficeByOfficeId().getAddress() + ". Chúng tôi gồm có:", italicFont));


            document.add(paragraphEmpty);
            document.add(new Paragraph("BÊN CHO THUÊ VĂN PHÒNG (BÊN A):", boldFont));
            document.add(combineTwoParagraph("Địa chỉ: ", contract.getOfficeByOfficeId().getAccountByOwnerUsername().getProfileByUsername().getAddress(), font, italicFont));
            document.add(combineTwoParagraph("Điện thoại: ",contract.getOfficeByOfficeId().getAccountByOwnerUsername().getProfileByUsername().getPhone(), font, italicFont));
            document.add(combineTwoParagraph("E-mail: ", contract.getOfficeByOfficeId().getAccountByOwnerUsername().getEmail(), font, italicFont));
            document.add(new Paragraph("Giấy phép số: …………………………………………………………………………………………………………….", font));
            document.add(new Paragraph("Mã số thuế: ……………………………………………………………………………………………………………….", font));
            document.add(new Paragraph("Tài khoản số: …………………………………………………………………………………………………………….", font));
            document.add(combineTwoParagraph("Do ông (bà): ", contract.getOfficeByOfficeId().getAccountByOwnerUsername().getProfileByUsername().getFullName(), font, italicFont));
            document.add(new Paragraph("Chức vụ: ……………………………………………………………………………………………..làm đại diện.", font));
            document.add(combineTwoParagraph("Là chủ sở hữu của văn phòng cho thuê: ", contract.getOfficeByOfficeId().getName(), font, italicFont));


            document.add(paragraphEmpty);
            document.add(new Paragraph("BÊN THUÊ VĂN PHÒNG (BÊN B):", boldFont));
            document.add(combineTwoParagraph("Địa chỉ: ", contract.getAccountByCustomerUsername().getProfileByUsername().getAddress(), font, italicFont));
            document.add(combineTwoParagraph("Điện thoại: ", contract.getAccountByCustomerUsername().getProfileByUsername().getPhone(), font, italicFont));
            document.add(combineTwoParagraph("E-mail: ", contract.getAccountByCustomerUsername().getEmail(), font, italicFont));
            document.add(new Paragraph("Giấy phép số: …………………………………………………………………………………………………………….", font));
            document.add(new Paragraph("Mã số thuế: ……………………………………………………………………………………………………………….", font));
            document.add(new Paragraph("Tài khoản số: …………………………………………………………………………………………………………….", font));
            document.add(combineTwoParagraph("Do ông (bà): ", contract.getAccountByCustomerUsername().getProfileByUsername().getFullName(), font, italicFont));
            document.add(new Paragraph("Chức vụ: …………………………………………………………………………………………………..làm đại diện.", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("Hai bên cùng thỏa thuận ký hợp đồng với những nội dung sau:", italicFont));


            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 1: ĐỐI TƯỢNG VÀ MỤC ĐÍCH CHO THUÊ", boldFont));
            document.add(new Paragraph("Bên A đồng ý cho bên Bên B thuê diện tích như sau:", font));
            document.add(new Chunk("1.1. Địa điểm và diện tích: ", font));
            document.add(new Chunk(contract.getOfficeByOfficeId().getAddress(), italicFont));
            document.add(new Chunk(", diện tích ", font));
            document.add(new Chunk(String.valueOf(contract.getOfficeByOfficeId().getArea()), italicFont));
            document.add(new Chunk(" mét vuông", font));
            document.add(paragraphEmpty);
            document.add(new Paragraph("1.2. Mục đích sử dụng: ………………………………………..………………………………………………………….", font));
            document.add(new Paragraph("1.3. Văn phòng, hệ thống cung cấp điện và nước được bàn giao cho Bên B phải trong tình trạng sử dụng tốt mà Bên B đã khảo sát và chấp nhận.", font));


            Long longTime = contract.getEndDate().getTime() - contract.getStartDate().getTime();
            int time = (int) Math.ceil(longTime / (86400000L * 30L));
            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 2: THỜI GIAN THUÊ", boldFont));
            document.add(combineTwoParagraph("2.1. Thời hạn thuê văn phòng: ", String.valueOf(time) + " tháng", font, italicFont));
            document.add(new Paragraph("2.2. Điều kiện gia hạn : Sau khi hết hợp đồng, bên B được quyền ưu tiên gia hạn hoặc kí kết hợp đồng mới, nhưng phải báo trước vấn đề cho bên A bằng văn bản ít nhất ….. tháng.", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 3: GIÁ THUÊ & CÁC CHI PHÍ KHÁC", boldFont));
            document.add(combineTwoParagraph("3.1. Giá thuê: " , addDot(contract.getPaymentFee()) + " VNĐ/m2", font, italicFont));
            document.add(new Paragraph("Giá thuê bao gồm thuế VAT 10% và tất cả các loại thuế có liên quan có thể phát sinh từ hợp đồng này; và không bao gồm tiền điện, điện thoại, fax, chi phí dịch vụ vệ sinh trong văn phòng và các chi phí khác do Bên B sử dụng.", font));
            document.add(new Paragraph("Giá thuê/cho thuê nói trên sẽ ổn định trong suốt thời gian thuê theo điều 2.1.", font));
            document.add(new Paragraph("3.2. Các chi phí khác:", font));
            document.add(new Paragraph("Tiền điện sinh hoạt: Do Bên B chịu theo giá điện kinh doanh do ngành điện lực địa phương quy định và theo thực tế sử dụng hằng tháng (có đồng hồ đo đếm điện riêng).", font));
            document.add(new Paragraph("Trong trường hợp cúp điện Bên B mua dầu để chạy máy phát điện, Bên B phải thanh toán tiền dầu chạy máy phát điện cùng tháng của tòa nhà ……………………………………………………………………………….", font));


            int depositMonth = (int) Math.ceil(contract.getDeposit() / (contract.getPaymentFee() * contract.getOfficeByOfficeId().getArea()));
            int paymentTermPrice = (int) (contract.getPaymentFee() * contract.getPaymentTermByPaymentTerm().getPaymentTime() * contract.getOfficeByOfficeId().getArea());
            int deposit = (int) (long) contract.getDeposit();
            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 4: THANH TOÁN", boldFont));
            document.add(new Paragraph("4.1. Đồng tiền tính toán: VNĐ (Đồng Việt Nam)", font));
            document.add(new Paragraph("4.2. Đồng tiền thanh toán: Bằng VNĐ (Đồng Việt Nam) quy đồi theo tỷ giá bán ra USD/VNĐ của Ngân hàng Ngoại Thương Việt Nam tại ………………………………………….………. tại thời điểm thanh toán.", font));
            document.add(new Chunk("4.3. Thời hạn thanh toán tiền đặt cọc: Trong vòng ", font));
            document.add(new Chunk(String.valueOf(contract.getDepositPaidDay()) + " (" + paymentTerm.get(contract.getDepositPaidDay()) + ")", italicFont));
            document.add(new Chunk(" ngày làm việc sau khi kí hợp đồng này, Bên B chuyển trước cho Bên A tiền đặt cọc tương đương với ", font));
            document.add(new Chunk(String.valueOf(depositMonth), italicFont));
            document.add(new Chunk(" tháng tiền thuê/cho thuê văn phòng là ", font));
            document.add(new Chunk(addDot(deposit) + " VNĐ.", italicFont));
            document.add(new Paragraph("Khoản tiền đặt cọc này sau khi đã trừ đi các khoản chi phí điện thoại, điện, v.v… sẽ được hoàn lại cho Bên B trong vòng …… ngày làm việc sau khi kết thúc hợp đồng cùng với điều kiện Bên B phải hoàn tất mọi trách nhiệm nêu trong hợp đồng này.", font));
            document.add(new Chunk("4.4. Tiền thuê văn phòng: Bên B thanh toán cho Bên A tiền thuê văn phòng của mỗi kỳ ", font));
            document.add(new Chunk(contract.getPaymentTermByPaymentTerm().getDescription(), italicFont));
            document.add(new Chunk(", tương đương ", font));
            document.add(new Chunk(addDot(paymentTermPrice) + " VNĐ.", italicFont));
            document.add(new Paragraph());
            document.add(new Chunk("Kỳ đầu: Trong vòng ", font));
            document.add(new Chunk(String.valueOf(contract.getFirstPaymentPaidDay()) + " (" + paymentTerm.get(contract.getFirstPaymentPaidDay()) + ")", italicFont));
            document.add(new Chunk(" ngày làm việc sau khi kí hợp đồng này, Bên B thanh toán cho Bên A.", font));
            document.add(new Paragraph());
            document.add(new Chunk("Các kỳ tiếp theo: Trong vòng ", font));
            document.add(new Chunk(String.valueOf(contract.getPaymentPaidDay()) + " (" + paymentTerm.get(contract.getPaymentPaidDay()) + ")", italicFont));
            document.add(new Chunk(" ngày làm việc đầu tiền của mỗi kỳ ", font));
            document.add(new Chunk(String.valueOf(contract.getPaymentTermByPaymentTerm().getPaymentTime()) + " (" + paymentTerm.get(contract.getPaymentTermByPaymentTerm().getPaymentTime()) +")", italicFont));
            document.add(new Chunk(" tháng, Bên B thanh toán cho Bên A số tiền ", font));
            document.add(new Chunk(addDot(paymentTermPrice) + " VNĐ", italicFont));
            document.add(new Paragraph());
            document.add(new Chunk("4.5. Trong trường hợp thanh toán chậm so với thời gian quy định nói trên, Bên B phải thanh  toán cho Bên A chi phí phụ trội bằng ", font));
            document.add(new Chunk(String.valueOf(contract.getAdditionalCharge()) + "%", italicFont));
            document.add(new Chunk(" cho mỗi ngày chậm thanh toán trên tổng số tiền chậm thanh toán. Nếu chậm thanh toán vượt quá …… (……………..) ngày, Bên A có quyền đơn phương chấm dứt hợp đồng này.", font));
            document.add(new Paragraph());
            document.add(new Paragraph("4.6. Tiền sử dụng điện sinh hoạt: Bên B thanh toán cho Bên A tiền sử dụng điện sinh hoạt hằng tháng trong vòng ….. (……….) ngày đầu tiên của tháng tiếp theo.", font));
            document.add(new Paragraph("4.7. Phương thức thanh toán: ………………………………………..……………………………………….", font));
            document.add(new Paragraph("Đơn vị thụ hưởng: ………………………………………..………………………………………………………….", font));
            document.add(new Paragraph("Tài khoản VNĐ chi phí chuyển tiền qua ngân hàng: Do Bên ….. chịu.", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 5: NGHĨA VỤ VÀ QUYỀN CỦA BÊN A", boldFont));
            document.add(new Paragraph("5.1. Nghĩa vụ của bên A:", boldFont));
            document.add(new Paragraph("a) Giao văn phòng và trang thiết bị gắn liền với văn phòng (nếu có) cho bên B theo đúng hợp đồng;", font));
            document.add(new Paragraph("b) Phổ biến cho bên B quy định về quản lý sử dụng văn phòng;", font));
            document.add(new Paragraph("c) Bảo đảm cho bên B sử dụng ổn định văn phòng trong thời hạn thuê;", font));
            document.add(new Paragraph("d) Bảo dưỡng, sửa chữa văn phòng theo định kỳ hoặc theo thỏa thuận; nếu bên A không bảo dưỡng, sửa chữa nhà mà gây thiệt hại cho bên B, thì phải bồi thường;", font));
            document.add(new Paragraph("e) Tạo điều kiện cho bên B sử dụng thuận tiện diện tích thuê;", font));
            document.add(new Paragraph("f) Nộp các khoản thuế liên quan đến văn phòng đang thuê theo quy định của pháp luật (nếu có).", font));
            document.add(new Paragraph("5.2. Quyền của bên A:", boldFont));
            document.add(new Paragraph("a) Yêu cầu bên B trả đủ tiền thuê văn phòng đúng kỳ hạn như đã thỏa thuận;", font));
            document.add(new Paragraph("b) Trường hợp chưa hết hạn hợp đồng mà bên A cải tạo văn phòng và được bên B đồng ý thì bên A được quyền điều chỉnh giá cho thuê văn phòng. Giá cho thuê nhà ở mới do các bên thoả thuận; trong trường hợp không thoả thuận được thì bên A có quyền đơn phương chấm dứt hợp đồng thuê văn phòng và phải bồi thường cho bên B theo quy định của pháp luật;", font));
            document.add(new Paragraph("c) Yêu cầu bên B có trách nhiệm trong việc sửa chữa phần hư hỏng, bồi thường thiệt hại do lỗi của bên B gây ra;", font));
            document.add(new Paragraph("d) Cải tạo, nâng cấp văn phòng cho thuê khi được bên B đồng ý, nhưng không được gây phiền hà cho bên B sử dụng văn phòng;", font));
            document.add(new Paragraph("e) Được lấy lại văn phòng cho thuê khi hết hạn hợp đồng thuê, nếu hợp đồng không quy định thời hạn thuê thì bên cho thuê muốn lấy lại văn phòng phải báo cho bên thuê biết trước sáu tháng.", font));
            document.add(new Paragraph("f) Đơn phương đình chỉ thực hiện hợp đồng nhưng phải báo cho bên B biết trước một tháng nếu không có thỏa thuận khác và yêu cầu bồi thường thiệt hại nếu bên B có một trong các hành vi sau đây:", font));
            document.add(new Paragraph("- Không trả tiền thuê văn phòng liên tiếp trong ……………. trở lên mà không có lý do chính đáng;", font));
            document.add(new Paragraph(" Sử dụng văn phòng không đúng mục đích thuê;", font));
            document.add(new Paragraph("- Cố ý làm văn phòng hư hỏng nghiêm trọng;", font));
            document.add(new Paragraph("- Sửa chữa, đổi hoặc cho người khác thuê lại toàn bộ hoặc một phần văn phòng đang thuê mà không có sự đồng ý của bên A;", font));
            document.add(new Paragraph("- Cố ý làm văn phòng hư hỏng nghiêm trọng;", font));
            document.add(new Paragraph("- Làm mất trật tự công cộng nhiều lần và ảnh hưởng nghiêm trọng đến sinh hoạt bình thường của những người xung quanh;", font));
            document.add(new Paragraph("- Làm ảnh hưởng nghiêm trọng đến vệ sinh môi trường;", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 5: NGHĨA VỤ VÀ QUYỀN CỦA BÊN B", boldFont));
            document.add(new Paragraph("5.1. Nghĩa vụ của bên B:", boldFont));
            document.add(new Paragraph("a) Sử dụng văn phòng đúng mục đích đã thỏa thuận, giữ gìn nhà ở và có trách nhiệm trong việc sửa chữa những hư hỏng do mình gây ra;", font));
            document.add(new Paragraph("b) Trả đủ tiền đặt cọc, thuê văn phòng đúng kỳ hạn đã thỏa thuận;", font));
            document.add(new Paragraph("c) Trả tiền điện, nước, điện thoại, vệ sinh và các chi phí phát sinh khác trong thời gian thuê và trước khi thanh lý hợp đồng;", font));
            document.add(new Paragraph("d) Trả nhà cho bên A theo đúng thỏa thuận.", font));
            document.add(new Paragraph("e) Chấp hành đầy đủ những quy định về quản lý sử dụng văn phòng;", font));
            document.add(new Paragraph("f) Không được chuyển nhượng hợp đồng thuê văn phòng hoặc cho người khác thuê lại trừ trường hợp được bên A đồng ý bằng văn bản;", font));
            document.add(new Paragraph("g) Chấp hành các quy định về giữ gìn vệ sinh môi trường và an ninh trật tự trong khu vực cư trú;", font));
            document.add(new Paragraph("h) Giao lại văn phòng cho bên A trong các trường hợp chấm dứt hợp đồng quy định tại hợp đồng này.", font));
            document.add(new Paragraph("i) Chịu trách nhiệm về bất kỳ/toàn bộ sự mất mát các trang thiết bị, nội thất trong văn phòng, tài sản cá nhân.", font));
            document.add(new Paragraph("5.2. Quyền của bên B:", boldFont));
            document.add(new Paragraph("a) Nhận văn phòng và trang thiết bị gắn liền (nếu có) theo đúng thoả thuận;", font));
            document.add(new Paragraph("b) Được đổi văn phòng đang thuê với bên thuê khác, nếu được bên A đồng ý bằng văn bản;", font));
            document.add(new Paragraph("c) Được thay đổi cấu trúc văn phòng nếu được bên A đồng ý bằng văn bản;", font));
            document.add(new Paragraph("d) Yêu cầu bên A sửa chữa kịp thời những hư hỏng để bảo đảm an toàn;", font));
            document.add(new Paragraph("e) Được tiếp tục thuê theo các điều kiện đã thỏa thuận với bên A trong trường hợp thay đổi chủ sở hữu văn phòng;", font));
            document.add(new Paragraph("f) Được ưu tiên ký hợp đồng thuê tiếp, nếu đã hết hạn thuê mà nhà vẫn dùng để cho thuê;", font));
            document.add(new Paragraph("g) Được ưu tiên mua văn phòng đang thuê, khi bên A thông báo về việc bán văn phòng;", font));
            document.add(new Paragraph("h) Đơn phương đình chỉ hợp đồng thuê văn phòng nhưng phải báo cho bên A biết trước một tháng nếu không có thỏa thuận khác và yêu cầu bồi thường thiệt hại nếu bên A có một trong các hành vi sau đây:", font));
            document.add(new Paragraph("- Không sửa chữa văn phòng khi chất lượng văn phòng giảm sút nghiêm trọng;", font));
            document.add(new Paragraph("- Tăng giá thuê văn phòng bất hợp lý;", font));
            document.add(new Paragraph("- Quyền sử dụng văn phòng bị hạn chế do lợi ích của người thứ ba.", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 6: CHẤM DỨT HỢP ĐỒNG", boldFont));
            document.add(new Paragraph("6.1. Hợp đồng này đương nhiên chấm dứt trong các trường hợp sau:", font));
            document.add(new Paragraph("a) Vào ngày hết hạn hợp đồng;", font));
            document.add(new Paragraph("b) Trường hợp bất khả kháng như thiên tai, bão lụt, chiến tranh, hỏa hoạn, v.v….;", font));
            document.add(new Paragraph("c) Bên B không thể tiếp tục theo quy định của cấp thẩm quyền;", font));
            document.add(new Paragraph("d) Theo quy định khác của pháp luật.", font));
            document.add(new Paragraph("e) Trong các trường hợp trên, Bên A sẽ hoàn lại cho Bên B tiền đặt cọc.", font));
            document.add(new Paragraph("f) Chậm thanh toán theo quy định của Điều 4.", font));
            document.add(new Paragraph("g) Trong trường hợp này, Bên A sẽ không hoàn lại cho Bên B tiền đặt cọc.", font));
            document.add(new Paragraph("6.2. Chấm dứt hợp đồng trước thời hạn do thỏa thuận của các Bên:", font));
            document.add(new Chunk("a) Hợp đồng này không được đơn phương chấm dứt trước thời hạn bởi bên nào. Nếu một trong hai bên muốn chấm dứt hợp đồng trước thời hạn, phải thông báo trước cho bên kia bằng văn bản ít nhất là 1 (một) tháng và thời hạn thuê phải đạt được tối thiểu là ", font));
            document.add(new Chunk(String.valueOf(contract.getOfficeByOfficeId().getMinTime()), italicFont));
            document.add(new Chunk(" tháng. Trong trường hợp này, Bên A sẽ hoàn trả lại cho Bên B tiền đặt cọc và tiền thuê văn phòng còn thừa của Bên B (nếu có).", font));
            document.add(new Paragraph("b) Nếu Bên B chấm dứt hợp đồng này trước thời hạn mà không tuân thủ quy định nói trên, Bên B sẽ mất tiền đặt cọc.", font));
            document.add(new Paragraph("c) Nếu Bên A chấm dứt hợp đồng này trước thời hạn mà không tuân thủ quy định nói trên, Bên A phải hoàn trả lại cho Bên B tiền đặt cọc, tiền thuê còn thừa của Bên B (nếu có) và phải bồi thường cho Bên B số tiền tương đương với tiền đặt cọc.", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 7: CAM KẾT CHUNG", boldFont));
            document.add(new Paragraph("7.1. Hai bên cam kết thực hiện nghiêm túc và đầy đủ các điều khoản và điều kiện quy định trong hợp đồng này. Mọi thay đổi, hủy bỏ hoặc bổ sung một hay nhiều điều khoản, điều kiện của hợp đồng này phải được cả hai bên thỏa thuận bằng văn bản và lập thành phụ lục hợp đồng.", font));
            document.add(new Paragraph("7.2. Trường hợp các cơ quan có thẩm quyền của Việt Nam ban hành các văn bản pháp lý liên quan đến việc cho thuê văn phòng, hợp đồng này sẽ được điều chỉnh cho phù hợp với những quy định của pháp luật Việt Nam.", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 8: GIẢI QUYẾT TRANH CHẤP", boldFont));
            document.add(new Paragraph("Tranh chấp phát sinh liên quan đến hợp đồng này hoặc việc vi phạm hợp đồng sẽ được giải quyết trước hết bằng thương lượng trên tinh thần thiện chí, hợp tác. Nếu thương lượng không thành thì vụ việc sẽ được đưa ra tòa án có thẩm quyền xét xử.", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("ĐIỀU 9: HIỆU LỰC CỦA HỢP ĐỒNG", boldFont));
            document.add(new Chunk("Hợp đồng này có hiệu lực pháp lý từ ngày ", font));
            document.add(new Chunk(String.valueOf(getDay(contract.getStartDate())), italicFont));
            document.add(new Chunk(" tháng ", font));
            document.add(new Chunk(String.valueOf(getMonth(contract.getStartDate())) , italicFont));
            document.add(new Chunk(" năm ", font));
            document.add(new Chunk(String.valueOf(getYear(contract.getStartDate())), italicFont));
            document.add(new Chunk(". Đến ngày ", font));
            document.add(new Chunk(String.valueOf(getDay(contract.getEndDate())), italicFont));
            document.add(new Chunk(" tháng ", font));
            document.add(new Chunk(String.valueOf(getMonth(contract.getEndDate())), italicFont));
            document.add(new Chunk(" năm ", font));
            document.add(new Chunk(String.valueOf(getYear(contract.getEndDate())), italicFont));
            document.add(new Paragraph("Hợp đồng được lập thành 2 (hai) bản, mỗi bên giữ một bản và có giá trị như nhau.", font));


            document.add(paragraphEmpty);
            document.add(new Paragraph("                  ĐẠI DIỆN BÊN A                                         ĐẠI DIỆN BÊN B", boldFont));
            document.add(new Paragraph("                      Chức vụ                                                  Chức vụ", font));
            document.add(new Paragraph("                 (Ký tên đóng dấu)                                            (Ký tên đóng dấu)", font));

            document.close(); // no need to close PDFwriter?

            /*String pdfFile = "E:/Hopdong" + contract.getId() + ".pdf";
            File file = new File(pdfFile);
            if (pdfFile.toString().endsWith(".pdf")) {
                Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + pdfFile);
            } else {
                //For cross platform use
                Desktop desktop = Desktop.getDesktop();
                desktop.open(file);
            }*/

        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return output.getAbsolutePath();
    }

    public int getDay(Date time) {
        long timeLong = time.getTime();
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timeLong);
        return cal.get(Calendar.DAY_OF_MONTH);
    }

    public int getMonth(Date time) {
        long timeLong = time.getTime();
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timeLong);
        return cal.get(Calendar.MONTH) + 1;
    }

    public int getYear(Date time) {
        long timeLong = time.getTime();
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timeLong);
        return cal.get(Calendar.YEAR);
    }

    public String addDot(int number) {
        DecimalFormat df = new DecimalFormat("#,###");
        df.setDecimalFormatSymbols(new DecimalFormatSymbols(Locale.TAIWAN));
        String formatNumber = df.format(new BigDecimal(number));
        return formatNumber.replaceAll(",",".");
    }

    public Paragraph combineTwoParagraph(String text1, String text2, Font font1, Font font2){
        Chunk param1 = new Chunk(text1,font1);
        Chunk param2 = new Chunk(text2,font2);
        Paragraph comb = new Paragraph();
        comb.add(param1);
        comb.add(param2);
        return comb;
    }

}
