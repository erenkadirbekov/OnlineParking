package com.parking.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "users")
public class Users implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Roles role;

    @OneToMany(mappedBy = "user")
    private List<UserCars> cars;

    @OneToMany(mappedBy = "user")
    private List<Reservations> reservations;

    @OneToMany(mappedBy = "owner")
    private List<Parkings> parkings;

    @ManyToOne
    @JoinColumn(name = "prk_id")
    private Parkings employeesParking;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    public Users() {
    }

    public Users(Roles role, List<UserCars> cars, List<Reservations> reservations, List<Parkings> parkings, String name, String surname, String email, String password) {
        this.role = role;
        this.cars = cars;
        this.reservations = reservations;
        this.parkings = parkings;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
    }

    public Users(Roles role, String name, String surname, String email, String password) {
        this.role = role;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Roles getRole() {
        return role;
    }

    public void setRole(Roles role) {
        this.role = role;
    }

    public List<UserCars> getCars() {
        return cars;
    }

    public void setCars(List<UserCars> cars) {
        this.cars = cars;
    }

    public List<Reservations> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservations> reservations) {
        this.reservations = reservations;
    }

    public List<Parkings> getParkings() {
        return parkings;
    }

    public void setParkings(List<Parkings> parkings) {
        this.parkings = parkings;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Parkings getEmployeesParking() {
        return employeesParking;
    }

    public void setEmployeesParking(Parkings employeesParking) {
        this.employeesParking = employeesParking;
    }
}
