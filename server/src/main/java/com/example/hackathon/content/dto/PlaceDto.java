package com.example.hackathon.content.dto;

import lombok.Builder;

@Builder
public record PlaceDto(
        Long placeId,
        String placeName,
        String placeOverview,
        String placeImage,
        String placeAddress,
        String openTime
) {
}
