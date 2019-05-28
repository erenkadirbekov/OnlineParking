package com.parking.beans;

import com.parking.entities.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;


public class DriverBean {
    @Autowired
    DBBean dbBean;

    private SessionFactory sessionFactory;
    private static final String TIMESTAMP_FORMAT = "MM/dd/yyyy HH:mm:ss";
    private static final String DATE_FORMAT = "MM/dd/yyyy";
    private static final SimpleDateFormat timeStampFormat = new SimpleDateFormat(TIMESTAMP_FORMAT);
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
    private static final String almatyTimeZone = "Asia/Almaty";
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

    public ArrayList<Reservations> getReservationsByParkingAndDate(Long parkingId, Timestamp startTime, Timestamp endTime) {
        Session session = sessionFactory.openSession();
        Query query = session.createSQLQuery("SELECT * FROM parking_slot_reservations r WHERE (DATE(r.start_time) = DATE(?) OR DATE(r.start_time) = DATE(?)) AND prk_id = ?").addEntity(Reservations.class);
        query.setParameter(1, startTime);
        query.setParameter(2, endTime);
        query.setParameter(3, parkingId);
        System.out.println(startTime + " " + endTime);
        ArrayList<Reservations> reservations = (ArrayList<Reservations>) query.getResultList();
        session.close();
        return reservations;
    }

    public ArrayList<UserCars> getDriverCars(Users driver){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<UserCars> query = builder.createQuery(UserCars.class);
        Root<UserCars> root = query.from(UserCars.class);
        Predicate predicate = builder.equal(root.get("user"), driver);
        ArrayList<UserCars> userCars = (ArrayList<UserCars>) session.createQuery(query.where(predicate)).getResultList();
        session.close();

        return userCars;
    }

    public UserCars getDriverCarByCarId(Long carId) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<UserCars> query = builder.createQuery(UserCars.class);
        Root<UserCars> root = query.from(UserCars.class);
        Predicate predicate = builder.equal(root.get("id"), carId);
        UserCars userCar = session.createQuery(query.where(predicate)).getSingleResult();
        session.close();

        return userCar;
    }

    public void deleteUserCar(UserCars car) {
        dbBean.deleteObject(car);
    }

    public int getNumberOfOccupiedSpaces(Long parkingId, Timestamp startTime, Timestamp endTime) {
        List<Reservations> reservations = getReservationsByParkingAndDate(parkingId, startTime, endTime);
        int counter = 0;
        for (Reservations reservation : reservations) {
            //reservation.setStartTime(convertTimestampByTimeZone(reservation.getStartTime(), almatyTimeZone));
            //reservation.setEndTime(convertTimestampByTimeZone(reservation.getEndTime(), almatyTimeZone));

            if ((startTime.getTime() >= reservation.getStartTime().getTime() && endTime.getTime() >= reservation.getEndTime().getTime() && startTime.getTime() < reservation.getEndTime().getTime())
                || (startTime.getTime() < reservation.getStartTime().getTime() &&
                    ((endTime.getTime() >= reservation.getEndTime().getTime()
                            || (endTime.getTime() < reservation.getEndTime().getTime()))))) {
                counter++;
            }
        }
        return counter;
    }

    public Timestamp createTimestamp(String date, int hour) {
        Timestamp timestamp = null;
        String time = createTime(hour);
        try {
            Date newDate = timeStampFormat.parse(date + " " + time);
            timestamp = new Timestamp(newDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return timestamp;
    }

    public Timestamp createTimestamp(String date, int startHour, int durationHours) {
        int endHour = startHour + durationHours;

        if (endHour >= 24) {
            int difference = endHour - 24;
            date = dateFormat.format(getNewDatePlusOneDay(date));
            return createTimestamp(date, difference);
        }

        return createTimestamp(date, endHour);
    }

    public String createTime(int hour) {
        String result = "";
        if (hour >= 0 && hour <= 9) {
            result += "0";
        }
        result += hour + ":00:00";
        return result;
    }

    public Date createDate(String date) {
        Date newDate = null;
        try {
            newDate = dateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return newDate;
    }

    public Date getNewDatePlusOneDay(String date) {
        Date date1 = createDate(date);
        LocalDateTime localDateTime = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        localDateTime = localDateTime.plusDays(1);
        Date currentDatePlusOneDay = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
        return currentDatePlusOneDay;
    }

    public Timestamp convertTimestampByTimeZone(Timestamp timestamp, String timeZone) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        TimeZone tzInAlmaty = TimeZone.getTimeZone(almatyTimeZone);
        sdf.setTimeZone(tzInAlmaty);

        String newDateString = sdf.format(timestamp);
        return new Timestamp(createDate(newDateString).getTime());
    }

    public void addUserCar(UserCars car) {
        dbBean.addObject(car);
    }

    public ArrayList<RegionalIndices> getAllRegionalIndices() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<RegionalIndices> query = builder.createQuery(RegionalIndices.class);
        Root<RegionalIndices> root = query.from(RegionalIndices.class);
        ArrayList<RegionalIndices> regionalIndices = (ArrayList<RegionalIndices>) session.createQuery(query).getResultList();
        session.close();

        return regionalIndices;
    }

    public String createCarNumber(Long regionalIndexId, String number) {
        RegionalIndices regionalIndex = getRegionalIndexById(regionalIndexId);
        number = number.toUpperCase();
        String carNumber = number + " |" + regionalIndex.getDigitalIndex() + "(" + regionalIndex.getLetterIndex() + ")";
        return carNumber;
    }

    public RegionalIndices getRegionalIndexById(Long regionalIndexId) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<RegionalIndices> query = builder.createQuery(RegionalIndices.class);
        Root<RegionalIndices> root = query.from(RegionalIndices.class);
        Predicate predicate = builder.equal(root.get("id"), regionalIndexId);
        RegionalIndices regionalIndex = session.createQuery(query.where(predicate)).getSingleResult();
        session.close();

        return regionalIndex;
    }
}
