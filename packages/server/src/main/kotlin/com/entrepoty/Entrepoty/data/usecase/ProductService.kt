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
import java.util.Objects
import kotlin.reflect.jvm.internal.impl.load.kotlin.JvmType

@Service
class ProductService {
    @Autowired
    lateinit var repository: ProductRepository

    @Autowired
    lateinit var modelsRepository: ProductModelRepository

    @Autowired
    lateinit var productDetailRepository: ProductDetailRepository;

    fun createProduct(product: CreateProductModel): Either<DomainError, ProductEntity> {
        val possibleModel = modelsRepository.findById(product.model)
        if (possibleModel.isEmpty) {
            return Either.Left(DomainError.notFound)
        }
        val createdProduct = repository.save(ProductEntity(possibleModel.get(), product.quantity, ""));

        val details = Array(product.quantity.toInt()) { _ -> generateDetail(createdProduct) };
        productDetailRepository.saveAll(details.toList());

        return Either.Right(createdProduct);
    }
    private fun generateDetail(product: ProductEntity): ProductDetailEntity {
        val response = ProductDetailEntity();
        response.product = product;
        return response;
    }

    fun loadUnique(id: Long): Either<DomainError, LoadUniqueProductResponse>{
        val product = repository.findById(id);
        if(product.isEmpty){
            return Either.Left(DomainError.notFound);
        }
        val details = productDetailRepository.findByProduct(product.get());
        return Either.Right(LoadUniqueProductResponse( product.get(), details))
    }

    fun loadProducts(): Either<DomainError, List<ProductEntity>> {
        return Either.Right(repository.findAll())
    }
}