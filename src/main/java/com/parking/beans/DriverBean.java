package com.parking.beans;

import com.parking.entities.Parkings;
import com.parking.entities.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;


public class DriverBean {

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public ArrayList<Parkings> getActiveParkings() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Parkings> query = builder.createQuery(Parkings.class);
        Root<Parkings> root = query.from(Parkings.class);
        ArrayList<Parkings> parkings = (ArrayList<Parkings>) session.createQuery(query.where(builder.equal(root.get("status"), 1))).getResultList();
        session.close();

        return parkings;
    }
}
