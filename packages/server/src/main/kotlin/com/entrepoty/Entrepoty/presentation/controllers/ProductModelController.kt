package com.entrepoty.Entrepoty.presentation.controllers

import com.entrepoty.Entrepoty.data.usecase.ProductModelService
import com.entrepoty.Entrepoty.domain.entities.ProductModelEntity
import com.entrepoty.Entrepoty.presentation.helpers.ResponseUtils
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/models")
class ProductModelController  {
    @Autowired
    lateinit var service: ProductModelService
    @Autowired
    lateinit var utils: ResponseUtils

    @PostMapping
    fun createModel(@RequestBody body: ProductModelEntity): ResponseEntity<ProductModelEntity> {
        return service.createModel(body).fold(
            { error -> utils.fromDomain(error) },
            { model -> ResponseEntity.ok(model) }
        );
    }
    @GetMapping
    fun loadModels(): ResponseEntity<List<ProductModelEntity>> {
        return service.loadModels().fold(
            { error -> utils.fromDomain(error) },
            { models -> ResponseEntity.ok(models) }
        );
    }

}