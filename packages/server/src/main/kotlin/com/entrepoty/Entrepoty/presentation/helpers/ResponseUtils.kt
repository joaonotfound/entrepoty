package com.entrepoty.Entrepoty.presentation.helpers

import com.entrepoty.Entrepoty.domain.entities.DomainError
import org.springframework.http.ResponseEntity
import org.springframework.stereotype.Component


@Component
class ResponseUtils {

    fun <T>fromDomain(error: DomainError): ResponseEntity<T> {
        return when( error) {
            DomainError.badRequest -> ResponseEntity.badRequest().build()
            DomainError.unauthorized -> ResponseEntity.status(401).build()
            DomainError.forbidden -> ResponseEntity.status(401).build()
            DomainError.serverError -> ResponseEntity.internalServerError().build()
            DomainError.conflict -> ResponseEntity.status(409).build()
            DomainError.notFound -> ResponseEntity.notFound().build()
        }
    }
}