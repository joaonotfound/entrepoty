package com.entrepoty.Entrepoty.presentation.controllers

import arrow.core.getOrElse
import com.entrepoty.Entrepoty.data.repositories.ProductDetailRepository
import com.entrepoty.Entrepoty.data.repositories.ProductModelRepository
import com.entrepoty.Entrepoty.data.usecase.FileService
import com.entrepoty.Entrepoty.data.usecase.ProductModelService
import com.entrepoty.Entrepoty.domain.entities.*
import com.entrepoty.Entrepoty.presentation.helpers.ResponseUtils
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestPart
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.multipart.MultipartFile
import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import kotlin.io.path.Path

@RestController
@RequestMapping("/api/v1/models")
class ProductModelController {
    @Autowired
    lateinit var service: ProductModelService

    @Autowired
    lateinit var utils: ResponseUtils

    @Autowired
    lateinit var fileService: FileService

    @Autowired
    lateinit var productDetailRepository: ProductDetailRepository

    @Autowired
    lateinit var productModelRepository: ProductModelRepository

    @PostMapping("/details")
    fun createDetails(@RequestBody body: CreateDetailsRequest): ResponseEntity<List<ProductDetailEntity>> {
        var model = productModelRepository.findById(body.product)
        if(model.isEmpty){
            return ResponseEntity.notFound().build()
        }
        val details = Array(body.quantity) { _ -> generateDetail(model.get()) }
        productDetailRepository.saveAll(details.toList())
        return ResponseEntity.ok(details.toList());
    }

    @PostMapping
    fun createModel(
        @RequestPart("name") name: String,
        @RequestPart("category") category: String,
        @RequestPart("image") image: MultipartFile,
        @RequestPart("quantity") quantity: String
    ): ResponseEntity<LoadUniqueProductModelResponse> {
        var savedFile = fileService.saveFile(image, ".jpg")
        return savedFile.fold({ domainError -> utils.fromDomain(domainError) },
            { createdFile ->
                var creation = ProductModelEntity()
                creation.name = name
                creation.category = category
                creation.image_path = createdFile.url

                return service.createModel(creation).fold(
                    { error -> utils.fromDomain(error) },
                    { model ->
                        val details = Array(quantity.toInt()) { _ -> generateDetail(creation) }
                        productDetailRepository.saveAll(details.toList())
                        return ResponseEntity.ok(LoadUniqueProductModelResponse(model, details.toList()))
                    }
                )
            }
        )
    }

    private fun generateDetail(product: ProductModelEntity): ProductDetailEntity {
        val response = ProductDetailEntity();
        response.product = product
        return response;
    }

    @GetMapping
    fun loadModels(): ResponseEntity<List<ProductModelEntity>> {
        return service.loadModels().fold(
            { error -> utils.fromDomain(error) },
            { models -> ResponseEntity.ok(models) }
        );
    }

    @GetMapping("{model}")
    fun loadProduct(@PathVariable("model") id: Long): ResponseEntity<LoadUniqueProductModelResponse> {
        return service.findProduct(id).fold(
            { error -> utils.fromDomain(error) },
            { product -> ResponseEntity.ok(product) }
        )
    }

    @DeleteMapping
    fun deleteModel(@RequestBody body: RemoveProductModelEntity): ResponseEntity<ProductModelEntity> {
        return service.deleteModel(body.id).fold(
            { error -> utils.fromDomain(error) },
            { models -> ResponseEntity.ok(models) }
        );
    }
}