package com.example.hackathon.tmdb.controller;

import com.example.hackathon.tmdb.application.TmdbService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api")
public class TmdbController {

    private final TmdbService tmdbService;

//    @GetMapping("/movie-image")
//    public String getMovieImage(@RequestParam String title) {
//        return tmdbService.getTvShowStartYear(title);
//    }
}