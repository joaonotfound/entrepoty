package com.entrepoty.Entrepoty.presentation.controllers

import com.entrepoty.Entrepoty.data.usecase.BorrowService
import com.entrepoty.Entrepoty.domain.entities.BorrowEntity
import com.entrepoty.Entrepoty.domain.entities.CreateBorrowModel
import com.entrepoty.Entrepoty.presentation.helpers.ResponseUtils
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/borrows")
class BorrowController {
    @Autowired
    lateinit var service: BorrowService
    @Autowired
    lateinit var utils: ResponseUtils

    @PostMapping
    fun createBorrow(@RequestBody body: CreateBorrowModel): ResponseEntity<BorrowEntity> {
        return service.createBorrow(body).fold(
            { error -> utils.fromDomain(error)},
            { borrow -> ResponseEntity.ok(borrow) }
        );
    }

    @GetMapping
    fun loadAll(): ResponseEntity<List<BorrowEntity>>{
        return service.loadAll().fold(
            { error -> utils.fromDomain(error)},
            { borrows -> ResponseEntity.ok(borrows) }
        );
    }
}