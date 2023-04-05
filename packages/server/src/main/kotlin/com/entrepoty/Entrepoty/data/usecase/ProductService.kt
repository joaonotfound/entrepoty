package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import arrow.core.left
import com.entrepoty.Entrepoty.data.repositories.ProductModelRepository
import com.entrepoty.Entrepoty.data.repositories.ProductRepository
import com.entrepoty.Entrepoty.domain.entities.CreateProductModel
import com.entrepoty.Entrepoty.domain.entities.DomainError
import com.entrepoty.Entrepoty.domain.entities.ProductEntity
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class ProductService {
    @Autowired
    lateinit var repository: ProductRepository

    @Autowired
    lateinit var modelsRepository: ProductModelRepository

    fun createProduct(product: CreateProductModel): Either<DomainError, ProductEntity> {
        var possibleModel = modelsRepository.findById(product.model)
        if (possibleModel.isEmpty) {
            return Either.Left(DomainError.notFound)
        }
        return Either.Right(repository.save(ProductEntity(possibleModel.get(), product.quantity, "")));

    }
    fun loadProducts(): Either<DomainError, List<ProductEntity>> {
        return Either.Right(repository.findAll())
    }
}