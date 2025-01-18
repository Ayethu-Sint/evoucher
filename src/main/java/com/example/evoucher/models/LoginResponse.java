package com.example.evoucher.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@RequiredArgsConstructor
public class LoginResponse {
    private String jwtToken;
    private String userName;
    private LocalDateTime expiresIn;
    private List<String> roles;

    public LoginResponse(String jwtToken, String userName, List<String> roles) {
        this.jwtToken = jwtToken;
        this.userName = userName;
        this.roles = roles;
    }
}
