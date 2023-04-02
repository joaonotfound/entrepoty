package com.entrepoty.Entrepoty.presentation.controllers

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/demo")
class UserController {
    @GetMapping
    fun index(): String {
        return "hello from secure"
    }
}