package com.example.hackathon.content.controller;

import com.example.hackathon.content.application.ContentService;
import com.example.hackathon.content.dto.InterestContentResponse;
import com.example.hackathon.content.dto.ScrapContentResponse;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api/content")
public class ContentController {
    private final ContentService contentService;
    @GetMapping("/interest")
    @Operation(summary = "내가 관심 있어 하는 장르의 작품 리스트 + 간편 주소를 가져옵니다. " ,description = "userId와 가져올 컨텐츠 갯수를 파라미터로 넣어주세요")
    public ResponseEntity<InterestContentResponse> getInterestContentResponse(@RequestParam Long userId, @RequestParam Integer pagesize) {
        InterestContentResponse interestContentResponse = contentService.getInterestContentResponse(userId, pagesize);
        return new ResponseEntity<>(interestContentResponse, HttpStatus.OK);
    }

    @GetMapping("/scrap")
    @Operation(summary = "내가 찜한 작품 리스트를 가져옵니다. " ,description = "userId를 파라미터로 넣어주세요")
    public ResponseEntity<ScrapContentResponse> getScrapContentResponse(@RequestParam Long userId) {
        ScrapContentResponse scrapContentResponse = contentService.getScrapContentResponse(userId);
        return new ResponseEntity<>(scrapContentResponse, HttpStatus.OK);
    }
}
