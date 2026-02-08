package com.dsaplatform.service;

import com.dsaplatform.dto.AuthDto;
import com.dsaplatform.model.User;
import com.dsaplatform.repository.UserRepository;
import com.dsaplatform.security.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AuthService {

        private final UserRepository userRepository;
        private final PasswordEncoder passwordEncoder;
        private final JwtTokenProvider jwtTokenProvider;
        private final AuthenticationManager authenticationManager;

        @Value("${admin.email}")
        private String adminEmail;

        @Transactional
        public AuthDto.AuthResponse register(AuthDto.RegisterRequest request) {
                if (userRepository.existsByEmail(request.getEmail())) {
                        throw new RuntimeException("Email already exists");
                }

                User.Role role = request.getEmail().equalsIgnoreCase(adminEmail)
                                ? User.Role.ADMIN
                                : User.Role.USER;

                User user = User.builder()
                                .email(request.getEmail())
                                .passwordHash(passwordEncoder.encode(request.getPassword()))
                                .name(request.getName())
                                .role(role)
                                .totalScore(0)
                                .problemsSolved(0)
                                .build();

                userRepository.save(user);

                String token = jwtTokenProvider.generateToken(user.getEmail());

                return AuthDto.AuthResponse.builder()
                                .token(token)
                                .email(user.getEmail())
                                .name(user.getName())
                                .role(user.getRole().name())
                                .build();
        }

        public AuthDto.AuthResponse login(AuthDto.LoginRequest request) {
                Authentication authentication = authenticationManager.authenticate(
                                new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));

                User user = userRepository.findByEmail(request.getEmail())
                                .orElseThrow(() -> new RuntimeException("User not found"));

                String token = jwtTokenProvider.generateToken(authentication);

                return AuthDto.AuthResponse.builder()
                                .token(token)
                                .email(user.getEmail())
                                .name(user.getName())
                                .role(user.getRole().name())
                                .build();
        }

        public AuthDto.UserResponse getCurrentUser(String email) {
                User user = userRepository.findByEmail(email)
                                .orElseThrow(() -> new RuntimeException("User not found"));

                return AuthDto.UserResponse.builder()
                                .id(user.getId().toString())
                                .email(user.getEmail())
                                .name(user.getName())
                                .role(user.getRole().name())
                                .totalScore(user.getTotalScore())
                                .problemsSolved(user.getProblemsSolved())
                                .build();
        }

        // Password Reset Logic
        private final com.dsaplatform.repository.PasswordResetTokenRepository passwordResetTokenRepository;
        private final EmailService emailService;

        @Transactional
        public void forgotPassword(String email) {
                User user = userRepository.findByEmail(email)
                                .orElseThrow(() -> new RuntimeException("User not found with email: " + email));

                // Delete existing token if any
                passwordResetTokenRepository.findByUser(user).ifPresent(passwordResetTokenRepository::delete);

                String token = java.util.UUID.randomUUID().toString();
                com.dsaplatform.model.PasswordResetToken resetToken = com.dsaplatform.model.PasswordResetToken.builder()
                                .token(token)
                                .user(user)
                                .expiryDate(java.time.LocalDateTime.now().plusHours(1)) // 1 hour expiry
                                .build();

                passwordResetTokenRepository.save(resetToken);

                String resetLink = "http://localhost:3000/reset-password?token=" + token;

                // Send Email
                emailService.sendSimpleMessage(
                                user.getEmail(),
                                "Password Reset Request",
                                "To reset your password, click the link below:\n\n" + resetLink
                                                + "\n\nThis link will expire in 1 hour.");
        }

        @Transactional
        public void resetPassword(String token, String newPassword) {
                com.dsaplatform.model.PasswordResetToken resetToken = passwordResetTokenRepository.findByToken(token)
                                .orElseThrow(() -> new RuntimeException("Invalid token"));

                if (resetToken.isExpired()) {
                        throw new RuntimeException("Token expired");
                }

                User user = resetToken.getUser();
                user.setPasswordHash(passwordEncoder.encode(newPassword));
                userRepository.save(user);

                passwordResetTokenRepository.delete(resetToken);
        }
}
