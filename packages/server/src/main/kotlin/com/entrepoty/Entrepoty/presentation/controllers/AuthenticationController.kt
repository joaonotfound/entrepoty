package com.entrepoty.Entrepoty.presentation.controllers

import com.entrepoty.Entrepoty.domain.entities.CreateAccountModel
import com.entrepoty.Entrepoty.domain.entities.AuthenticationModel
import com.entrepoty.Entrepoty.data.usecase.AuthenticationService
import com.entrepoty.Entrepoty.domain.entities.LoginAccountModel
import com.entrepoty.Entrepoty.presentation.helpers.ResponseUtils
import org.apache.coyote.Response
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
    @Autowired
    private lateinit var utils: ResponseUtils;

    @PostMapping("/signup")
    fun createAccount(@RequestBody body: CreateAccountModel): ResponseEntity<AuthenticationModel> {
        var response = service.registerAccount(body);

        return response.fold(
            { domainError -> utils.fromDomain(domainError) },
            { account -> ResponseEntity.ok(account) });
    }

    @PostMapping("/login")
    fun authenticate(@RequestBody body: LoginAccountModel): ResponseEntity<AuthenticationModel> {
        var response = service.loginAccount(body);
        return response.fold(
            { domainError -> utils.fromDomain(domainError) },
            { account -> ResponseEntity.ok(account) }
        );
    }

}