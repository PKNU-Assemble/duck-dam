package com.example.hackathon.dataset.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Data {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "mediaType")
    private String mediaType;
    @Column(name = "titleName")
    private String titleName;
    @Column(name = "placeName")
    private String placeName;
    @Column(name = "placeTypel")
    private String placeTypel;
    @Column(name = "placeOverview")
    private String placeOverview;
    @Column(name = "openTime")
    private String openTime;
    @Column(name = "restDay")
    private String restDay;
    @Column(name = "address")
    private String address;
    @Column(name = "mapY")
    private String mapY;
    @Column(name = "mapX")
    private String mapX;
    @Column(name = "tel")
    private String tel;
}
