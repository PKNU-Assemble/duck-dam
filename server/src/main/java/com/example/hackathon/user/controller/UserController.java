package com.example.hackathon.user.controller;

import com.example.hackathon.exception.ResourceNotFoundException;
import com.example.hackathon.user.domain.User;
import com.example.hackathon.user.repository.UserRepository;
import com.example.hackathon.oauth.security.CurrentUser;
import com.example.hackathon.oauth.security.UserPrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

//    @Autowired
//    private UserRepository userRepository;

//    @GetMapping("/user/me")
//    @PreAuthorize("hasRole('USER')")
//    public User getCurrentUser(@CurrentUser UserPrincipal userPrincipal) {
//        return userRepository.findById(userPrincipal.getId())
//                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userPrincipal.getId()));
//    }
}
