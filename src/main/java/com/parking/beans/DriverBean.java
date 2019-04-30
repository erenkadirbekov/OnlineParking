package com.parking.beans;

import com.parking.entities.Parkings;
import com.parking.entities.Reservations;
import com.parking.entities.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


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

    public ArrayList<Reservations> getReservationsByParkId(Parkings park) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Reservations> query = builder.createQuery(Reservations.class);
        Root<Reservations> root = query.from(Reservations.class);
        ArrayList<Reservations> reservations = (ArrayList<Reservations>) session.createQuery(query.where(builder.equal(root.get("parking"), park))).getResultList();
        session.close();

        return reservations;
    }


    public ArrayList<Reservations> getReservationsByDriver(Users user) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Reservations> query = builder.createQuery(Reservations.class);
        Root<Reservations> root = query.from(Reservations.class);
        ArrayList<Reservations> reservations = (ArrayList<Reservations>) session.createQuery(query.where(builder.equal(root.get("user"), user))).getResultList();
        session.close();

        return reservations;
    }

    public Reservations getReservationById(Long id) {

        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Reservations> query = builder.createQuery(Reservations.class);
        Root<Reservations> root = query.from(Reservations.class);
        Reservations reservation = session.createQuery(query.where(builder.equal(root.get("id"), id))).getSingleResult();
        session.close();

        return reservation;

    }

    public Timestamp createTimestamp(String date, int hour) {
        Timestamp timestamp = null;
        String time = createTime(hour);
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/YYYY hh:mm:ss");
        try {
            Date newDate = dateFormat.parse(date + time);
            timestamp = new Timestamp(newDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return timestamp;
    }

    public String createTime(int hour) {
        String result = "";
        if (hour >= 0 && hour <= 9) {
            result += "0";
        }
        result += hour + ":00:00";
        return result;
    }
}
