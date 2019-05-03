package com.parking.beans;

import com.parking.entities.CarBrands;
import com.parking.entities.CarModels;
import com.parking.entities.Parkings;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.criteria.*;
import java.util.ArrayList;

public class AdminBean {
    @Autowired
    DBBean dbBean;

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addParking(Parkings parking) {
        dbBean.addObject(parking);
    }

    private int statusActive = 1;
    private int statusNonActive = 0;

    public ArrayList<Parkings> getAllNotAddedParkings() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Parkings> query = builder.createQuery(Parkings.class);
        Root<Parkings> root = query.from(Parkings.class);
        Predicate predicate = builder.equal(root.get("status"), statusNonActive);
        ArrayList<Parkings> parkings = (ArrayList<Parkings>) session.createQuery(query.where(predicate)).getResultList();
        session.close();

        return parkings;
    }

    public void deleteParkingById(Long id) {
        Parkings parking = getParkingById(id);

        dbBean.deleteObject(parking);
    }

    public Parkings getParkingById(Long id) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Parkings> query = builder.createQuery(Parkings.class);
        Root<Parkings> root = query.from(Parkings.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        Parkings parking = session.createQuery(query.where(predicate)).getSingleResult();
        session.close();

        return parking;
    }

    public void updateInactiveParking(Parkings parking) {
        dbBean.updateObject(parking);
    }

    public void addNewCarBrand(CarBrands brand) {
        dbBean.addObject(brand);
    }

    public void addNewCarModel(CarModels model) {
        dbBean.addObject(model);
    }

    public boolean isCarModelExists(CarModels model) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CarModels> query = builder.createQuery(CarModels.class);
        Root<CarModels> root = query.from(CarModels.class);
        Predicate predicate1 = builder.equal(root.get("name"), model.getName());
        Predicate predicate2 = builder.equal(root.get("brand"), model.getBrand());
        CarModels carModel = session.createQuery(query.where(builder.and(predicate1, predicate2))).getSingleResult();
        session.close();

        if (carModel != null) return true;
        return false;
    }

    public ArrayList<Parkings> getActiveParkings() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Parkings> query = builder.createQuery(Parkings.class);
        Root<Parkings> root = query.from(Parkings.class);
        Predicate predicate = builder.equal(root.get("status"), statusActive);
        ArrayList<Parkings> parkings = (ArrayList<Parkings>) session.createQuery(query.where(predicate)).getResultList();
        session.close();

        return parkings;
    }

}
