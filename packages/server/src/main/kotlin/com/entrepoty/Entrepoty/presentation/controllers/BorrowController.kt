package com.entrepoty.Entrepoty.presentation.controllers

import arrow.core.Either
import com.entrepoty.Entrepoty.data.repositories.UserRepository
import com.entrepoty.Entrepoty.data.usecase.BorrowService
import com.entrepoty.Entrepoty.domain.entities.BorrowEntity
import com.entrepoty.Entrepoty.domain.entities.CreateBorrowModel
import com.entrepoty.Entrepoty.presentation.helpers.ResponseUtils
import com.entrepoty.Entrepoty.services.JwtService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/borrows")
class BorrowController {
    @Autowired
    lateinit var service: BorrowService

    @Autowired
    lateinit var utils: ResponseUtils

    @Autowired
    lateinit var jwtService: JwtService

    @Autowired
    lateinit var userRepository: UserRepository;

    @PostMapping
    fun createBorrow(
        @RequestBody body: CreateBorrowModel,
        @RequestHeader("Authorization") authorization: String
    ): ResponseEntity<BorrowEntity> {
        var createdByUsername = jwtService.extractUsername(authorization.replace("Bearer ", ""))
        print("username: " + createdByUsername)
        var createdBy = userRepository.findByUsername(createdByUsername)
        print(createdBy)
        if(createdBy.isEmpty){
            return ResponseEntity.internalServerError().build();
        }
        return utils.fromEither(service.createBorrow(body, createdBy.get()));
    }

    @GetMapping("{borrow}")
    fun loadById(@PathVariable("borrow") borrow: Long): ResponseEntity<BorrowEntity> {
        return utils.fromEither(service.loadById(borrow))
    }

    @GetMapping
    fun loadAll(): ResponseEntity<List<BorrowEntity>> {
        return service.loadAll().fold(
            { error -> utils.fromDomain(error) },
            { borrows -> ResponseEntity.ok(borrows) }
        );
    }
}