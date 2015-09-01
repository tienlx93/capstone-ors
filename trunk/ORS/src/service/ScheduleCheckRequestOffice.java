package service;

import dao.*;
import entity.*;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class ScheduleCheckRequestOffice implements Job {

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        RequestOfficeDAO dao = new RequestOfficeDAO();
        List<RequestOffice> requests = dao.findAll();

        OfficeDAO officeDAO = new OfficeDAO();
        List<Office> offices = officeDAO.getAllOfficeAvailable();

        EmailQueueDAO emailDao = new EmailQueueDAO();

        for (RequestOffice request : requests) {

            long createDate = request.getCreateDate().getTime();
            Date date = new Date();
            long currentDate = date.getTime();

            if((currentDate - createDate) / (24 * 60 * 60 * 1000) >= 365){
                dao.remove(request);
                return;
            }

            Collection<RequestAmenity> amenities = request.getRequestAmenitiesById();

            List<Office> officeAmenities = checkAmenity(offices, amenities);
            List<Office> officeCategories = checkCategory(officeAmenities, request);
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

            if (officeIds != "") {
                if ((request.getOfficeSuggested() != null) && (request.getOfficeSuggested().equals(officeIds))) {

                } else {
                    emailQueue.setOfficeIds(officeIds);

                    dao.updateOfficeSuggest(request.getId(), officeIds);
                    emailDao.save(emailQueue);
                }
            }
            System.out.println("Check request office: " + emailQueue.getOfficeIds());

        }
    }

    private List<Office> checkAmenity(List<Office> offices, Collection<RequestAmenity> amenities) {
        List<Office> officeAmenities = new ArrayList<>();

        if(amenities.size() == 0) {
            return offices;
        }
        for (Office office : offices) {
            int count = 0;
            Collection<OfficeAmenity> amenityCollection = office.getOfficeAmenitiesById();
            for (RequestAmenity amenity : amenities) {
                for (OfficeAmenity officeAmenity : amenityCollection) {
                    if(amenity.getAmenityId() == officeAmenity.getAmenityId()) {
                        count++;
                    }
                }
            }
            if(amenities.size() == 1) {
                if(count > 0) {
                    officeAmenities.add(office);
                }
            } else if(amenities.size() >= 2) {
                if (count >= 2) {
                    officeAmenities.add(office);
                }
            }
        }
        return officeAmenities;
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
                double price = office.getPrice();
                if(office.getCategoryId() == 1){
                    price = office.getPrice()/office.getArea();
                }
                if (((price - (price / 5)) <= request.getPrice()) && ((price + (price / 5)) >= request.getPrice())) {
                    officePrices.add(office);
                }
            }
        }

        return officePrices;
    }

    private List<Office> checkArea(List<Office> offices, RequestOffice request) {
        List<Office> officeAreas = new ArrayList<>();

        for (Office office : offices) {
            if (request.getCategoryId() == 1) {
                if (((office.getArea() - (office.getArea() / 5)) <= request.getArea()) && ((office.getArea() + (office.getArea() / 5)) >= request.getArea())) {
                    officeAreas.add(office);
                }
            } else {
                if(request.getArea() <= office.getArea()) {
                    officeAreas.add(office);
                }
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
