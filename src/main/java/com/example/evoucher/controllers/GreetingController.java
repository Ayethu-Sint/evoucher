package com.example.evoucher.controllers;

import com.example.evoucher.Jwt.JwtUtils;
import com.example.evoucher.entities.Token;
import com.example.evoucher.models.LoginRequest;
import com.example.evoucher.models.LoginResponse;
import com.example.evoucher.repositories.TokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class GreetingController {
    @Autowired
    private TokenRepository tokenRepository;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtils jwtUtils;

    @PostMapping("/signIn")
    public ResponseEntity<?> authenticateUser(@RequestBody LoginRequest loginRequest) {
        Authentication authentication;
        try {
            authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUserName(), loginRequest.getPassword()));
        } catch (AuthenticationException e) {
            Map<String, Object> response = new HashMap<>();
            response.put("message", "Bad Credentials");
            response.put("status", false);
            return new ResponseEntity<Object>(response, HttpStatus.NOT_FOUND);
        }

        SecurityContextHolder.getContext().setAuthentication(authentication);
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String jwtToken = jwtUtils.generateJwtToken(userDetails);

        List<String> roles = userDetails.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .toList();

        LoginResponse loginResponse = new LoginResponse(jwtToken, userDetails.getUsername(), roles);
        loginResponse.setExpiresIn(LocalDateTime.now().plusDays(1));
        saveToken(loginResponse);
        return ResponseEntity.ok(loginResponse);
    }

    private void saveToken(LoginResponse loginResponse) {
        Token token = new Token();
        token.setAccessToken(loginResponse.getJwtToken());
        token.setExpiredAt(loginResponse.getExpiresIn());
        tokenRepository.deleteAll();
        tokenRepository.save(token);
    }

    @GetMapping("/getToken")
    public ResponseEntity<Map<String, String>> getToken() {
        return tokenRepository.findAll()
                .stream()
                .findFirst()
                .map(t -> ResponseEntity.ok(Map.of("accessToken", t.getAccessToken())))
                .orElseGet(() -> ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("error", "Token not found")));
    }
}
