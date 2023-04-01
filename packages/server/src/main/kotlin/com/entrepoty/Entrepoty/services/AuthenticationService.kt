package com.entrepoty.Entrepoty.services

import com.entrepoty.Entrepoty.entities.*
import com.entrepoty.Entrepoty.repositories.UserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Service

@Service
class AuthenticationService {
    @Autowired
    lateinit var userRepository: UserRepository;
    @Autowired
    lateinit var passwordEncoder: PasswordEncoder
    @Autowired
    lateinit var jwtService: JwtService
    @Autowired
    lateinit var authenticationManager: AuthenticationManager
    fun register(request: RegisterRequest): AccessToken {
        var user = User(request.username, passwordEncoder.encode(request.password), Role.USER)
        userRepository.save(user);
        var token = jwtService.generateToken(user);
        return AccessToken(token);
    }
    fun auth(request: AuthenticationRequest): AccessToken {
        authenticationManager.authenticate(UsernamePasswordAuthenticationToken(request.username, request.password))
        var user = userRepository.findByUsername(request.username).orElseThrow()
        var token = jwtService.generateToken(user);
        return AccessToken(token);

    }
}