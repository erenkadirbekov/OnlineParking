package com.parking.beans;

import com.parking.entities.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.sql.Timestamp;
import java.util.ArrayList;

public class DBBean {
    private SessionFactory sessionFactory;
    private static final int statusNonActive = 0;
    private static final int statusDenied = 2;
    private static final int statusActive = 1;

    public static int getStatusNonActive() {
        return statusNonActive;
    }

    public static int getStatusDenied() {
        return statusDenied;
    }

    public static int getStatusActive() {
        return statusActive;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Users getUserByEmail(String email) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = criteriaBuilder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        Users users = session.createQuery(query.where(criteriaBuilder.equal(root.get("email"), email))).getSingleResult();
        session.close();
        return users;
    }

    public Roles getRoleByName(String name) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Roles> query = criteriaBuilder.createQuery(Roles.class);
        Root<Roles> root = query.from(Roles.class);
        Roles role = session.createQuery(query.where(criteriaBuilder.equal(root.get("name"), name))).getSingleResult();
        session.close();
        return role;
    }

    public void addObject(Object object) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(object);
        transaction.commit();
        session.close();
    }

    public void deleteObject(Object object) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(object);
        transaction.commit();
        session.close();
    }

    public void updateObject(Object object) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(object);
        transaction.commit();
        session.close();
    }

    public Users getUserData(){
        Users user = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(!(authentication instanceof AnonymousAuthenticationToken)){
            UserDetails ud = (UserDetails) authentication.getPrincipal();
            user = getUserByEmail(ud.getUsername());
        }
        return user;
    }

    public Parkings getParkingById(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Parkings> query = builder.createQuery(Parkings.class);
        Root<Parkings> root = query.from(Parkings.class);
        Parkings parking = session.createQuery(query.where(builder.equal(root.get("id"), id))).getSingleResult();
        session.close();
        return parking;
    }

    public void deactivateParking(Parkings parking) {
        parking.setStatus(statusNonActive);
        updateObject(parking);
    }


    public Users getUserById(Long id) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = criteriaBuilder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        Users users = session.createQuery(query.where(criteriaBuilder.equal(root.get("id"), id))).getSingleResult();
        session.close();
        return users;
    }

    public ArrayList<Reservations> getTodaysReservations() {
        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("SELECT * FROM parking_slot_reservations r WHERE DATE(r.end_date) = CURDATE() AND r.status = ?")
                .addEntity(Reservations.class);
        query.setParameter(1, statusActive);
        ArrayList<Reservations> reservations = (ArrayList<Reservations>) query.getResultList();
        session.close();
        return reservations;
    }
}
