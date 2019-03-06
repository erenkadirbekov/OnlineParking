package com.parking.entities;

import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Latitude;
import org.hibernate.search.annotations.Longitude;
import org.hibernate.search.annotations.Spatial;

import javax.persistence.*;
import java.io.Serializable;

@Spatial
@Indexed
@Entity
@Table(name = "Parkings")
public class Parkings implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "prk_id")
    private Long id;

    @Latitude
    private Double latitude;

    @Longitude
    private Double longitude;

    @Column(name = "slots_number")
    private int slots;

    @Column(name = "available_slots")
    private int availableSlots;

    @ManyToOne
    @JoinColumn(name = "owner_id")
    private Users owner;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private Cities city;

    @Column(name = "house_number")
    private String houseNumber;

    @Column(name = "street")
    private String street;

    @Column(name = "postal_code")
    private String postalCode;

    @Column(name = "cost")
    private double cost;

    public Parkings() {
    }

    public Parkings(Double latitude, Double longitude, int slots, int availableSlots, Users owner, Cities city, String houseNumber, String street, String postalCode, double cost) {
        this.latitude = latitude;
        this.longitude = longitude;
        this.slots = slots;
        this.availableSlots = availableSlots;
        this.owner = owner;
        this.city = city;
        this.houseNumber = houseNumber;
        this.street = street;
        this.postalCode = postalCode;
        this.cost = cost;
    }

    public Parkings(Double latitude, Double longitude, int slots, Users owner, Cities city, String houseNumber, String street, String postalCode, double cost) {
        this.latitude = latitude;
        this.longitude = longitude;
        this.slots = slots;
        this.owner = owner;
        this.city = city;
        this.houseNumber = houseNumber;
        this.street = street;
        this.postalCode = postalCode;
        this.cost = cost;
    }

    public Parkings(Double latitude, Double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getSlots() {
        return slots;
    }

    public void setSlots(int slots) {
        this.slots = slots;
    }

    public int getAvailableSlots() {
        return availableSlots;
    }

    public void setAvailableSlots(int availableSlots) {
        this.availableSlots = availableSlots;
    }

    public Users getOwner() {
        return owner;
    }

    public void setOwner(Users owner) {
        this.owner = owner;
    }

    public Cities getCity() {
        return city;
    }

    public void setCity(Cities city) {
        this.city = city;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }
}
