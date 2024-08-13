package com.example.hackathon.content.dto;

import lombok.Builder;

import java.util.List;
@Builder
public record SearchContentResponse(
        Boolean hasNextPage,
        List<SearchContentDto> searchContentDtos
) {
}
