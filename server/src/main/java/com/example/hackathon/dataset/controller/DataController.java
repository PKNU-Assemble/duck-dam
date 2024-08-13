package com.example.hackathon.dataset.controller;

import com.example.hackathon.dataset.application.DataService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@AllArgsConstructor
@RequestMapping("/api/csv")
public class DataController {

    private final DataService dataService;

//    @PostMapping("/upload")
//    public String uploadCSV(@RequestParam("file") MultipartFile file) {
//        try {
//            dataService.saveCsv(file);
//            return "File uploaded and data saved successfully!";
//        } catch (Exception e) {
//            return "Failed to upload and save data: " + e.getMessage();
//        }
//    }
}