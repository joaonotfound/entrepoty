package com.entrepoty.Entrepoty.domain.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.domain.entities.Customer
import com.entrepoty.Entrepoty.domain.entities.DomainError

interface RemoveCustomerUsecase {
    fun removeCustomer(enrollment: String): Either<DomainError, Customer>;
}