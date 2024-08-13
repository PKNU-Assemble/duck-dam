package com.example.hackathon.user.dto;

import lombok.Builder;

@Builder
public record UserInfoResponse(
        String username,
        String email,
        String profileImage
) {
}
