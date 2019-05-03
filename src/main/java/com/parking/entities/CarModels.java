package com.parking.entities;

import com.google.gson.annotations.Expose;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "Car_models")
public class CarModels implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Expose
    @Column(name = "model_id")
    private Long id;

    @Expose
    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private CarBrands brand;

    @Expose
    @OneToMany(mappedBy = "model")
    private List<UserCars> cars;

    public CarModels() {
    }


    public CarModels(String name, CarBrands brand) {
        this.name = name;
        this.brand = brand;
    }

    public CarModels(String name, CarBrands brand, List<UserCars> cars) {
        this.name = name;
        this.brand = brand;
        this.cars = cars;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CarBrands getBrand() {
        return brand;
    }

    public void setBrand(CarBrands brand) {
        this.brand = brand;
    }

    public List<UserCars> getCars() {
        return cars;
    }

    public void setCars(List<UserCars> cars) {
        this.cars = cars;
    }
}
