package com.example.hackathon.content.dto;

import lombok.Builder;

@Builder
public record SimpleContentDto(
        Long contentId,
        String contentTitle,
        String contentImage,
        Boolean isScraped
) {
}
