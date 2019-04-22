package com.parking.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "parking_slot_reservations")
public class Reservations implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "reservation_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @ManyToOne
    @JoinColumn(name = "user_car_id")
    private UserCars car;

    @ManyToOne
    @JoinColumn(name = "prk_id")
    private Parkings parking;

    @Column(name = "reserve_time")
    private Timestamp reserveTime;

    @Column(name = "start_time")
    private int startTime;

    @Column(name = "park_hours")
    private int parkHours;

    @Column(name = "cost")
    private double cost;

    @Column(name = "status")
    private int status;

    public Reservations() {
    }

    public Reservations(Users user, /*UserCars car,*/ Parkings parking, Timestamp reserveTime, int startTime, int parkHours, double cost, int status) {
        this.user = user;
        //this.car = car;
        this.parking = parking;
        this.reserveTime = reserveTime;
        this.startTime = startTime;
        this.parkHours = parkHours;
        this.cost = cost;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public UserCars getCar() {
        return car;
    }

    public void setCar(UserCars car) {
        this.car = car;
    }

    public Parkings getParking() {
        return parking;
    }

    public void setParking(Parkings parking) {
        this.parking = parking;
    }

    public Timestamp getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(Timestamp reserveTime) {
        this.reserveTime = reserveTime;
    }

    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int startTime) {
        this.startTime = startTime;
    }

    public int getParkHours() {
        return parkHours;
    }

    public void setParkHours(int parkHours) {
        this.parkHours = parkHours;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
