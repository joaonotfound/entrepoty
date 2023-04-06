package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import arrow.core.left
import arrow.core.right
import com.entrepoty.Entrepoty.data.repositories.CustomersRepository
import com.entrepoty.Entrepoty.data.repositories.ProductRepository
import com.entrepoty.Entrepoty.domain.entities.BorrowEntity
import com.entrepoty.Entrepoty.domain.entities.CreateBorrowModel
import com.entrepoty.Entrepoty.domain.entities.DomainError
import com.entrepoty.Entrepoty.domain.usecase.BorrowRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import java.util.Date

@Service
class BorrowService {
    @Autowired
    lateinit var borrowRepository: BorrowRepository
    @Autowired
    lateinit var productRepository: ProductRepository
    @Autowired
    lateinit var customersRepository: CustomersRepository
    fun createBorrow(creation: CreateBorrowModel): Either<DomainError, BorrowEntity> {
        var possibleProduct = productRepository.findById(creation.product)
        if(possibleProduct.isEmpty){
            return Either.Left(DomainError.notFound)
        }
        var possibleCustomer = customersRepository.findById(creation.customer)
        if(possibleCustomer.isEmpty){
            return Either.Left(DomainError.notFound)
        }
        return Either.Right(borrowRepository.save(BorrowEntity(possibleCustomer.get(), possibleProduct.get(), creation.date)));
    }
    fun loadById(id: Long): Either<DomainError, BorrowEntity> {
        var response = borrowRepository.findById(id)
        return if (response.isEmpty == true ) Either.Left(DomainError.notFound) else Either.Right(response.get())
    }
    fun loadAll(): Either<DomainError, List<BorrowEntity>> {
        return Either.Right(borrowRepository.findAll());
    }
}