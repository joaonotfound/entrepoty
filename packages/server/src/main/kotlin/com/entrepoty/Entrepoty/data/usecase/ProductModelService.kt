package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.data.repositories.ProductModelRepository
import com.entrepoty.Entrepoty.domain.entities.DomainError
import com.entrepoty.Entrepoty.domain.entities.ProductModelEntity
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class ProductModelService {
    @Autowired
    lateinit var repository: ProductModelRepository;

    fun createModel(model: ProductModelEntity): Either<DomainError, ProductModelEntity>{
        return Either.Right(repository.save(model));
    }

    fun loadModels(): Either<DomainError, List<ProductModelEntity>>{
        return Either.Right(repository.findAll());
    }

}