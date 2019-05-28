package com.parking.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "User_cars")
public class UserCars implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_car_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private CarBrands brand;

    @ManyToOne
    @JoinColumn(name = "model_id")
    private CarModels model;

    @Column(name = "car_number")
    private String carNumber;

    @OneToMany(mappedBy = "car")
    private List<Reservations> reservations;

    public UserCars() {
    }

    public UserCars(Users user, CarBrands brand, CarModels model, String carNumber) {
        this.user = user;
        this.brand = brand;
        this.model = model;
        this.carNumber = carNumber;
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

    public CarBrands getBrand() {
        return brand;
    }

    public void setBrand(CarBrands brand) {
        this.brand = brand;
    }

    public CarModels getModel() {
        return model;
    }

    public void setModel(CarModels model) {
        this.model = model;
    }

    public List<Reservations> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservations> reservations) {
        this.reservations = reservations;
    }
}
