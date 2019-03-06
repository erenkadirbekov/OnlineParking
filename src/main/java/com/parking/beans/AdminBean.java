package com.parking.beans;

import com.parking.entities.Parkings;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;

public class AdminBean {
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

    public ArrayList<Parkings> getAllNotAddedParkings() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Parkings> query = builder.createQuery(Parkings.class);
        Root<Parkings> root = query.from(Parkings.class);
        Predicate predicate = builder.equal(root.get("status"), 0);
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


}
