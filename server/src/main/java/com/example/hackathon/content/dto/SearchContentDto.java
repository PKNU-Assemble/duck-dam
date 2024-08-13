package com.example.hackathon.content.dto;

import lombok.Builder;

@Builder
public record SearchContentDto(
        Long contentId,
        String contentTitle,
        String contentImage) {
}
