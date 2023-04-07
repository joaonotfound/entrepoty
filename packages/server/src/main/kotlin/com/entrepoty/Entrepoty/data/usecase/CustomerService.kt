package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.data.repositories.CustomersRepository
import com.entrepoty.Entrepoty.domain.entities.Customer
import com.entrepoty.Entrepoty.domain.entities.DomainError
import com.entrepoty.Entrepoty.domain.usecase.CreateCustomerUsecase
import com.entrepoty.Entrepoty.domain.usecase.LoadCustomersUsecase
import com.entrepoty.Entrepoty.domain.usecase.RemoveCustomerUsecase
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class CustomerService : CreateCustomerUsecase, LoadCustomersUsecase, RemoveCustomerUsecase {
    @Autowired
    lateinit var repository: CustomersRepository;

    override fun createCustomer(customer: Customer): Either<DomainError, Customer> {
        var possibleAccount = repository.findByEnrollment(customer.enrollment);
        if(!possibleAccount.isEmpty){
            return  Either.Left(DomainError.conflict)
        }
        return Either.Right(repository.save(customer))
    }
    fun loadCustomer(enrollment: String): Either<DomainError, Customer>{
        var user = repository.findByEnrollment(enrollment);
        return if (user.isEmpty) Either.Left(DomainError.notFound) else Either.Right(user.get())
    }
    override fun removeCustomer(enrollment: String): Either<DomainError, Customer> {
        var user = repository.findByEnrollment(enrollment);
        if(user.isEmpty){
            return Either.Left(DomainError.notFound);
        }
        repository.delete(user.get());
        return Either.Right(user.get());
    }
    override fun loadCustomers(): List<Customer> {
        return repository.findAll()
    }
}