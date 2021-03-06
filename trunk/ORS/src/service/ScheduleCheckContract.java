package service;

import dao.*;
import entity.*;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.channels.AcceptPendingException;
import java.util.Date;
import java.util.List;

/**
 * Created by xps on 7/17/2015.
 */
public class ScheduleCheckContract implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        ContractDAO dao = new ContractDAO();
        List<Contract> contractList = dao.getContractListAvailable();

        Date date = new Date();
        long currentDate = date.getTime();
        long endDate, dayTime;
        for (Contract contract : contractList) {
            if (contract.getStatusId() == 1) {
                endDate = contract.getEndDate().getTime();
                dayTime = Math.round((endDate - currentDate) / (24 * 60 * 60 * 1000));

                if (currentDate - endDate > 0) {

                    dao.changeStatus(contract.getId(), 4);
                    sendEmail(contract.getId(), contract.getStatusId(), contract.getCustomerUsername());

                    // Update area for office parent when contract expired
                    OfficeDAO officeDAO = new OfficeDAO();
                    Office office = officeDAO.get(contract.getOfficeId());
                    if (office.getParentOfficeId() != null) {
                        Office officeParent = officeDAO.get(office.getParentOfficeId());
                        officeDAO.updateArea(officeParent.getId(), officeParent.getArea() + office.getArea());
                    } else {
                        office.setStatusId(1);
                        officeDAO.update(office.getId(), office);
                    }

                    // Update rental item when contract expired
                    RentalDAO rentalDAO = new RentalDAO();
                    List<Rental> rentals = rentalDAO.getRentalListByContract(contract.getId());

                    RepairDAO repairDAO = new RepairDAO();
                    List<Repair> repairList = repairDAO.getRepairListByContract(contract.getId());

                    List<Contract> subcontract = dao.getContractListByParentContractId(contract.getId());

                    if(subcontract != null && subcontract.size() > 0) {
                        if (rentals != null && rentals.size() > 0) {
                            for (Rental rental : rentals) {
                                if(rental.getStatusId() == 1 || rental.getStatusId() == 2 || rental.getStatusId() == 3) {
                                    rentalDAO.updateContractId(rental.getId(), subcontract.get(0).getId());
                                }
                            }
                        }

                        if (repairList != null && repairList.size() > 0) {
                            for (Repair repair : repairList) {
                                if(repair.getRepairStatusId() == 1 || repair.getRepairStatusId() == 2) {
                                    repairDAO.updateContractId(repair.getId(), subcontract.get(0).getId());
                                }
                            }
                        }
                    } else {
                        RentalDetailDAO rentalDetailDAO = new RentalDetailDAO();
                        RentalItemDAO rentalItemDAO = new RentalItemDAO();
                        if (rentals != null && rentals.size() > 0) {
                            for (Rental rental : rentals) {
                                List<RentalDetail> rentalDetailList = rentalDetailDAO.getRentalDetailByRental(rental.getId());
                                for (RentalDetail rentalDetail : rentalDetailList) {
                                    RentalItem rentalItem = rentalItemDAO.get(rentalDetail.getRentalItemId());
                                    rentalItemDAO.updateQuantity(rentalDetail.getRentalItemId(), rentalItem.getQuantity() + rentalDetail.getQuantity());
                                }
                                rentalDAO.changeStatus(rental.getId(), 5);
                            }
                        }

                        // Update repair request when contract expired

                        if (repairList != null && repairList.size() > 0) {
                            for (Repair repair : repairList) {
                                if (repair.getRepairStatusId() != 3) {
                                    repairDAO.changeStatus(repair.getId(), 4);
                                }
                            }
                        }
                    }
                } else if (dayTime == 7) {
//                System.out.println(contract.getId());
                    sendEmail(contract.getId(), contract.getStatusId(), contract.getCustomerUsername());
                }
            }
        }

    }

    private void sendEmail(int id, int status, String username) {
        String charset = "UTF-8";
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.findByUsername(username);

        String param1 = Integer.toString(id);
        String param2 = Integer.toString(status);
        String param3 = account.getEmail();

        URL gwtServlet = null;
        try {
            ConstantService constantService = new ConstantService();
            String host = constantService.readProperty("host");
            String query = String.format("id=%s&status=%s&email=%s",
                    URLEncoder.encode(param1, charset),
                    URLEncoder.encode(param2, charset),
                    URLEncoder.encode(param3, charset));

            gwtServlet = new URL(host + "/contractMail" + "?" + query);
            HttpURLConnection servletConnection = (HttpURLConnection) gwtServlet.openConnection();
            servletConnection.setRequestMethod("GET");
            servletConnection.setDoOutput(true);
            InputStream response = gwtServlet.openStream();

            ObjectOutputStream objOut = new ObjectOutputStream(servletConnection.getOutputStream());
//            objOut.writeObject(p);
            objOut.flush();
            objOut.close();

        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

