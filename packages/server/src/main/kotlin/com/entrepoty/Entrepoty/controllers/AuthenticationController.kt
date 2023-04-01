package com.entrepoty.Entrepoty.controllers

import com.entrepoty.Entrepoty.entities.AccessToken
import com.entrepoty.Entrepoty.entities.AuthenticationRequest
import com.entrepoty.Entrepoty.entities.AuthenticationResponse
import com.entrepoty.Entrepoty.entities.RegisterRequest
import com.entrepoty.Entrepoty.services.AuthenticationService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/auth")
class AuthenticationController {

    @Autowired
     private lateinit var service: AuthenticationService;

    @PostMapping("/signup")
    fun createAccount(@RequestBody body: RegisterRequest): ResponseEntity<AuthenticationResponse>{
        return ResponseEntity.ok(service.register(body))
    }
    @PostMapping("/login")
    fun authenticate(@RequestBody body: AuthenticationRequest): ResponseEntity<AuthenticationResponse> {
        return ResponseEntity.ok(service.auth(body))
    }

}