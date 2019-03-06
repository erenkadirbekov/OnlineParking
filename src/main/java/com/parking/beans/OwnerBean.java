package com.parking.beans;

import com.parking.entities.Cities;
import com.parking.entities.Parkings;
import com.parking.entities.Roles;
import com.parking.entities.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;

public class OwnerBean {
    @Autowired
    DBBean dbBean;

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public ArrayList<Parkings> getOwnParkings(Users users) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Parkings> query = builder.createQuery(Parkings.class);
        Root<Parkings> root = query.from(Parkings.class);
        ArrayList<Parkings> parkingsArrayList = (ArrayList<Parkings>) session.createQuery(query.where(builder.and(builder.equal(root.get("status"), 1),builder.equal(root.get("owner"), users)))).getResultList();
        session.close();
        return parkingsArrayList;
    }

    public ArrayList<Cities> getAllCities(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Cities> query = builder.createQuery(Cities.class);
        Root<Cities> root = query.from(Cities.class);
        ArrayList<Cities> cities = (ArrayList<Cities>) session.createQuery(query).getResultList();
        return cities;
    }

    public Cities getCityById(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Cities> query = builder.createQuery(Cities.class);
        Root<Cities> root = query.from(Cities.class);
        Cities cities = session.createQuery(query.where(builder.equal(root.get("id"), id))).getSingleResult();
        return cities;
    }

    public void addNewParking(Parkings parking){
        dbBean.addObject(parking);
    }


}