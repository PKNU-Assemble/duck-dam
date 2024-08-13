package com.example.hackathon.user.controller;

import com.example.hackathon.exception.ResourceNotFoundException;
import com.example.hackathon.oauth.security.CurrentUser;
import com.example.hackathon.user.application.MypageService;
import com.example.hackathon.user.domain.User;
import com.example.hackathon.user.dto.UserInfoResponse;
import com.example.hackathon.user.repository.UserRepository;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/mypage")
public class MypageController {
    private final MypageService mypageService;
    @GetMapping("/info")
    @Operation(summary = "유저 정보를 가져옵니다." ,description = "userId를 파라미터로 넣어주세요")
    public ResponseEntity<UserInfoResponse> getUserInfo(@RequestParam Long userId) {
        return new ResponseEntity<>(mypageService.getUserInfo(userId), HttpStatus.OK);
    }

    @PutMapping("/update/nickname")
    @Operation(summary = "유저 닉네임 수정 입니다. " ,description = "userId, 수정할 닉네임을 파라미터로 넣어주세요")
    public ResponseEntity<String> updateUserInfo(@RequestParam Long userId,
                                                 @RequestParam String nickname){
        return new ResponseEntity<>(mypageService.updateUserName(userId,nickname), HttpStatus.OK);
    }
}
