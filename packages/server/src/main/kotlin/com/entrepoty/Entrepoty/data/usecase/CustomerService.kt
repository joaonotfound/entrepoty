package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.data.repositories.CustomersRepository
import com.entrepoty.Entrepoty.domain.entities.Customer
import com.entrepoty.Entrepoty.domain.entities.DomainError
import com.entrepoty.Entrepoty.domain.usecase.CreateCustomerUsecase
import com.entrepoty.Entrepoty.domain.usecase.LoadCustomersUsecase
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class CustomerService : CreateCustomerUsecase, LoadCustomersUsecase {
    @Autowired
    lateinit var repository: CustomersRepository;

    override fun createCustomer(customer: Customer): Either<DomainError, Customer> {
        var possibleAccount = repository.findByEnrollment(customer.enrollment);
        if(!possibleAccount.isEmpty){
            return  Either.Left(DomainError.conflict)
        }
        return Either.Right(repository.save(customer))
    }

    override fun loadCustomers(): List<Customer> {
        return repository.findAll()
    }
}