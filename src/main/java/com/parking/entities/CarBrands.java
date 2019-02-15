package com.parking.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "Car_brands")
public class CarBrands implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "brand_id")
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "brand")
    private List<CarModels> models;

    @OneToMany(mappedBy = "brand")
    private List<UserCars> cars;

    public CarBrands(String name, List<CarModels> models, List<UserCars> cars) {
        this.name = name;
        this.models = models;
        this.cars = cars;
    }

    public CarBrands() {
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

    public List<CarModels> getModels() {
        return models;
    }

    public void setModels(List<CarModels> models) {
        this.models = models;
    }

    public List<UserCars> getCars() {
        return cars;
    }

    public void setCars(List<UserCars> cars) {
        this.cars = cars;
    }
}
