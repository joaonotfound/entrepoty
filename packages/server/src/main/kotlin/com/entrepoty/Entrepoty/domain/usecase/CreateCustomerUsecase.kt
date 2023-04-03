package com.entrepoty.Entrepoty.domain.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.domain.entities.Customer
import com.entrepoty.Entrepoty.domain.entities.DomainError

interface CreateCustomerUsecase {
    fun createCustomer(customer: Customer): Either<DomainError, Customer>;
}