package com.parking.entities;


import javax.persistence.*;


@Entity
@Table(name = "regional_indices")
public class RegionalIndices {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "regional_index_id")
    private Long id;

    @Column(name = "region_name")
    private String name;

    @Column(name = "digital_index")
    private String digitalIndex;

    @Column(name = "letter_index")
    private String letterIndex;

    public RegionalIndices() {
    }

    public RegionalIndices(String name, String digitalIndex, String letterIndex) {
        this.name = name;
        this.digitalIndex = digitalIndex;
        this.letterIndex = letterIndex;
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

    public String getDigitalIndex() {
        return digitalIndex;
    }

    public void setDigitalIndex(String digitalIndex) {
        this.digitalIndex = digitalIndex;
    }

    public String getLetterIndex() {
        return letterIndex;
    }

    public void setLetterIndex(String letterIndex) {
        this.letterIndex = letterIndex;
    }
}
