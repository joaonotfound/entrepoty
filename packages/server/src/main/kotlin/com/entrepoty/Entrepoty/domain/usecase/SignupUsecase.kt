package com.entrepoty.Entrepoty.domain.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.domain.entities.AuthenticationModel
import com.entrepoty.Entrepoty.domain.entities.CreateAccountModel
import com.entrepoty.Entrepoty.domain.entities.DomainError

interface SignupUsecase {
    fun registerAccount(account: CreateAccountModel): Either<DomainError, AuthenticationModel>;
}