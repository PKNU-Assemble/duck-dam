package com.example.hackathon.content.controller;

import com.example.hackathon.content.application.ContentService;
import com.example.hackathon.content.dto.InterestContentResponse;
import com.example.hackathon.content.dto.RecentKeywordResponse;
import com.example.hackathon.content.dto.ScrapContentResponse;
import com.example.hackathon.content.dto.SearchContentResponse;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @PatchMapping("/scrap")
    @Operation(summary = "원하는 작품 찜하기. " ,description = "userId와 contentId를 파라미터로 넣어주세요. \n 스크랩된 상태면 스크랩이 해제되고, 스크랩 안된 상태면 스크랩이 됩니다.")
    public ResponseEntity<String> getScrapContentResponse(@RequestParam Long userId, @RequestParam Long contentId) {
        return new ResponseEntity<>(contentService.scrapContent(userId, contentId), HttpStatus.OK);
    }

    @GetMapping("/search")
    @Operation(summary = "검색어로 원하는 컨텐츠 검색하는 api 입니다. " ,description = "검색 키워드와 검색 타입을 입력해주세요. \n 검색 타입은 (movie, drama) 두가지입니다. \n hasNextPage 값 -> true : 다음 페이지 있음, false : 다음 페이지 없음, 현재 페이지가 끝")
    public ResponseEntity<SearchContentResponse> getScrapContentResponse(@RequestParam(defaultValue = "1") Long userId,
                                                                         @RequestParam String keyword,
                                                                         @RequestParam(defaultValue = "drama") String searchType,
                                                                         @RequestParam(defaultValue = "9") Integer pagesize,
                                                                         @RequestParam(defaultValue = "0") Integer pageindex) {
        SearchContentResponse searchContentResponse = contentService.searchContent(userId,keyword, searchType, pagesize, pageindex);
        return new ResponseEntity<>(searchContentResponse, HttpStatus.OK);
    }
    @GetMapping("/search/recent/keyword")
    @Operation(summary = "최근 검색한 키워드를 가져옵니다 " ,description = "userId를 파라미터로 넣어주세요.\n 최대 6개까지만 가져옵니다.")
    public ResponseEntity<RecentKeywordResponse> getRecentKeyword(@RequestParam(defaultValue = "1") Long userId) {
        RecentKeywordResponse recentKeywordResponse = contentService.getRecentKeyword(userId);
        return new ResponseEntity<>(recentKeywordResponse, HttpStatus.OK);
    }

}