package com.example.hackathon.dataset.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class DataField {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "titleName")
    private String titleName;
    @Column(name = "mediaType")
    private String mediaType;
    @Column(name = "image")
    private String image;
    @Column(name = "genre")
    private String genre;
}
