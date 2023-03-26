package com.entrepoty.Entrepoty.controllers

import com.entrepoty.Entrepoty.entities.User
import com.entrepoty.Entrepoty.repositories.UserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.Mapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/logon")
class UserController {
    @Autowired
    lateinit var repository: UserRepository;

    @PostMapping
    fun createUser(@RequestBody body: User): User {
        return repository.save(body)
    }
}