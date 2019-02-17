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

    public Roles() {
    }

    public Roles(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

}
