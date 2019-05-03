package com.parking.services;

import com.parking.beans.DBBean;
import com.parking.beans.DriverBean;
import com.parking.entities.Reservations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@EnableScheduling
public class UpdateReservations {
    @Autowired
    DBBean dbBean;

    private static final String TIMESTAMP_FORMAT = "MM/dd/yyyy HH:mm:ss";
    private static final SimpleDateFormat timeStampFormat = new SimpleDateFormat(TIMESTAMP_FORMAT);

    @Scheduled(cron = "* * * * *", zone = "Asia/Almaty")
    public void updateReservationStatus() {
        Timestamp currentTime = getCurrentDate();
        ArrayList<Reservations> reservations = dbBean.getTodaysReservations();
        for (Reservations reservation : reservations) {
            if (reservation.getEndTime().getTime() <= currentTime.getTime()) {
                reservation.setStatus(dbBean.getStatusNonActive());
                dbBean.updateObject(reservation);
            }
        }
    }

    public Timestamp getCurrentDate() {
        return Timestamp.valueOf(timeStampFormat.format(new Date()));
    }
}
