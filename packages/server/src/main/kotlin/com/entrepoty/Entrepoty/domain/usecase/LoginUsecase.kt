package com.entrepoty.Entrepoty.domain.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.domain.entities.AuthenticationModel
import com.entrepoty.Entrepoty.domain.entities.CreateAccountModel
import com.entrepoty.Entrepoty.domain.entities.DomainError
import com.entrepoty.Entrepoty.domain.entities.LoginAccountModel

interface LoginUsecase {
    fun loginAccount(account: LoginAccountModel): Either<DomainError, AuthenticationModel>;
}