package com.example.hackathon.content.dto;

import lombok.Builder;

@Builder
public record ContentDto(
        Long contentId,
        String contentTitle,
        String contentImage,
        Boolean isScraped,
        String address
) {
}
