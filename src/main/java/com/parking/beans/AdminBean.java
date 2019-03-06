package com.parking.beans;

import com.parking.entities.Parkings;
import org.hibernate.SessionFactory;

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


}
