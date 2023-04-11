package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import arrow.core.right
import com.entrepoty.Entrepoty.data.repositories.ProductDetailRepository
import com.entrepoty.Entrepoty.data.repositories.ProductModelRepository
import com.entrepoty.Entrepoty.domain.entities.DomainError
import com.entrepoty.Entrepoty.domain.entities.LoadUniqueProductModelResponse
import com.entrepoty.Entrepoty.domain.entities.ProductModelEntity
import com.entrepoty.Entrepoty.presentation.controllers.ProductModelController
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class ProductModelService {
    @Autowired
    lateinit var repository: ProductModelRepository;

    @Autowired
    lateinit var productDetailRepository: ProductDetailRepository

    fun createModel(model: ProductModelEntity): Either<DomainError, ProductModelEntity> {
        return Either.Right(repository.save(model));
    }

    fun findProduct(id: Long): Either<DomainError, LoadUniqueProductModelResponse> {
        var product = repository.findById(id)
        val details = productDetailRepository.findByProduct(product.get())
        return if (product.isEmpty) Either.Left(DomainError.notFound) else Either.Right(LoadUniqueProductModelResponse(product.get(), details));
    }

    fun loadModels(): Either<DomainError, List<ProductModelEntity>> {
        return Either.Right(repository.findAll());
    }

    fun deleteModel(id: Long): Either<DomainError, ProductModelEntity> {
        var possibleModel = repository.findById(id);
        if (possibleModel.isEmpty) {
            return Either.Left(DomainError.notFound);
        }
        repository.delete(possibleModel.get());
        return Either.Right(possibleModel.get());
    }
}