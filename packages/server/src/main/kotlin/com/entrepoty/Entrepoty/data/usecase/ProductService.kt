package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import arrow.core.left
import arrow.core.right
import com.entrepoty.Entrepoty.data.repositories.ProductDetailRepository
import com.entrepoty.Entrepoty.data.repositories.ProductModelRepository
import com.entrepoty.Entrepoty.data.repositories.ProductRepository
import com.entrepoty.Entrepoty.domain.entities.*
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class ProductService {
    @Autowired
    lateinit var repository: ProductRepository

    @Autowired
    lateinit var modelsRepository: ProductModelRepository

    @Autowired
    lateinit var productDetailRepository: ProductDetailRepository;

    fun createProduct(product: CreateProductModel): Either<DomainError, ProductEntity> {
        var possibleModel = modelsRepository.findById(product.model)
        if (possibleModel.isEmpty) {
            return Either.Left(DomainError.notFound)
        }
        var createdProduct = repository.save(ProductEntity(possibleModel.get(), product.quantity, ""));
        var details = Array(product.quantity.toInt()) { _ -> ProductDetailEntity(createdProduct) };
        productDetailRepository.saveAll(details.toList());

        return Either.Right(createdProduct);
    }

    fun loadProducts(): Either<DomainError, List<ProductEntity>> {
        return Either.Right(repository.findAll())
    }
}