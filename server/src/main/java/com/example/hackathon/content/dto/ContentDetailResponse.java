package com.example.hackathon.content.dto;

import lombok.Builder;

import java.util.List;

@Builder
public record ContentDetailResponse(
        Long contentId,
        String contentTitle,
        String contentImage,
        String contentType,
        Boolean isScraped,
        List<String> addressTag,
        List<PlaceDto> placeDtos
) {
}
