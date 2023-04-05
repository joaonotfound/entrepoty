package com.entrepoty.Entrepoty.presentation.controllers

import com.entrepoty.Entrepoty.data.usecase.ProductModelService
import com.entrepoty.Entrepoty.domain.entities.ProductModelEntity
import com.entrepoty.Entrepoty.domain.entities.RemoveProductModelEntity
import com.entrepoty.Entrepoty.presentation.helpers.ResponseUtils
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestPart
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.multipart.MultipartFile

@RestController
@RequestMapping("/api/v1/models")
class ProductModelController  {
    @Autowired
    lateinit var service: ProductModelService
    @Autowired
    lateinit var utils: ResponseUtils

    @PostMapping
    fun createModel(@RequestPart("name") name: String, @RequestPart("image") image: MultipartFile,): ResponseEntity<ProductModelEntity> {
        var creation = ProductModelEntity()
        creation.name = name

        return service.createModel(creation).fold(
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


    @DeleteMapping
    fun deleteModel(@RequestBody body: RemoveProductModelEntity): ResponseEntity<ProductModelEntity>{
        return service.deleteModel(body.id).fold(
            { error -> utils.fromDomain(error) },
            { models -> ResponseEntity.ok(models) }
        );
    }
}