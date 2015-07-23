package service;

import dao.*;
import entity.*;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ScheduleCheckRequestOffice implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        RequestOfficeDAO dao = new RequestOfficeDAO();
        List<RequestOffice> requests = dao.findAll();

        OfficeDAO officeDAO = new OfficeDAO();
        List<Office> offices = officeDAO.findAll();

        EmailQueueDAO emailDao = new EmailQueueDAO();

        for (RequestOffice request : requests) {

            List<Office> officeCategories = checkCategory(offices, request);
            List<Office> officePrices = checkPrice(officeCategories, request);
            List<Office> officeAreas = checkArea(officePrices, request);
            List<Office> officeSuggest = checkDistrict(officeAreas, request);

            EmailQueue emailQueue = new EmailQueue();
            emailQueue.setUsername(request.getCustomerUsername());
            emailQueue.setCreateTime(new Timestamp((new java.util.Date()).getTime()));

            String officeIds = "";

            for (Office office : officeSuggest) {
                officeIds += office.getId() + ",";
            }

            if ((request.getOfficeSuggested() != null) && (request.getOfficeSuggested().equals(officeIds))) {

            } else {
                emailQueue.setOfficeIds(officeIds);

                dao.updateOfficeSuggest(request.getId(), officeIds);
                emailDao.save(emailQueue);
            }
            System.out.println("Check request office: " + emailQueue.getOfficeIds());

        }
    }


    private List<Office> checkCategory(List<Office> offices, RequestOffice request) {
        List<Office> officeCategories = new ArrayList<>();

        for (Office office : offices) {
            if (office.getCategoryId() == request.getCategoryId()) {
                officeCategories.add(office);
            }
        }

        return officeCategories;
    }

    private List<Office> checkPrice(List<Office> offices, RequestOffice request) {
        List<Office> officePrices = new ArrayList<>();

        for (Office office : offices) {
            if (office.getPrice() != null) {
                if (((office.getPrice() - (office.getPrice() / 10)) <= request.getPrice()) && ((office.getPrice() + (office.getPrice() / 10)) >= request.getPrice())) {
                    officePrices.add(office);
                }
            }
        }

        return officePrices;
    }

    private List<Office> checkArea(List<Office> offices, RequestOffice request) {
        List<Office> officeAreas = new ArrayList<>();

        for (Office office : offices) {
            if (((office.getArea() - (office.getArea() / 10)) <= request.getArea()) && ((office.getArea() + (office.getArea() / 10)) >= request.getArea())) {
                officeAreas.add(office);
            }
        }

        return officeAreas;
    }

    private List<Office> checkDistrict(List<Office> offices, RequestOffice request) {
        List<Office> officeDistricts = new ArrayList<>();

        for (Office office : offices) {
            if (request.getDistrict().equals(office.getDistrict())) {
                officeDistricts.add(office);
            }
        }

        return officeDistricts;
    }

    private List<Office> findDuplicate(List<Office> list_1, List<Office> list_2) {
        List<Office> officeDuplicates = new ArrayList<>();

        for (Office office1 : list_1) {
            for (Office office2 : list_2) {
                if (office1.getId() == office2.getId()) {
                    officeDuplicates.add(office1);
                }
            }
        }

        return officeDuplicates;
    }
}
