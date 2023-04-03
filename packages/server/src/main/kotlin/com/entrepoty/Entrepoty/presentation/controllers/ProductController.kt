package com.entrepoty.Entrepoty.presentation.controllers

import com.entrepoty.Entrepoty.data.usecase.ProductService
import com.entrepoty.Entrepoty.domain.entities.CreateProductModel
import com.entrepoty.Entrepoty.domain.entities.ProductEntity
import com.entrepoty.Entrepoty.presentation.helpers.ResponseUtils
import org.apache.coyote.Response
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/products")
class ProductController {
    @Autowired
    lateinit var service: ProductService

    @Autowired
    lateinit var utils: ResponseUtils

    @GetMapping
    fun loadAll(): ResponseEntity<List<ProductEntity>> {
        var response = service.loadProducts();
        return response.fold(
            { error -> utils.fromDomain(error) },
            { products -> ResponseEntity.ok(products) }
        );
    }

    @PostMapping
    fun createProduct(@RequestBody product: CreateProductModel): ResponseEntity<ProductEntity> {
        var response = service.createProduct(product);
        return response.fold(
            { error -> utils.fromDomain(error) },
            { product -> ResponseEntity.ok(product) }
        );
    }
}