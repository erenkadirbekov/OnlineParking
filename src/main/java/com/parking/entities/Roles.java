package com.parking.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "roles")
public class Roles implements Serializable {
    @Id
    @Column(name = "role_id")
    private Long id;

    @Column(name = "name")
    private String name;

    public Roles() {
    }

    public Roles(Long id, String name) {
        this.id = id;
        this.name = name;
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
}
