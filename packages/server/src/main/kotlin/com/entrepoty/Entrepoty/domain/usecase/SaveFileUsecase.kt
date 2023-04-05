package com.entrepoty.Entrepoty.domain.usecase

import arrow.core.Either
import com.entrepoty.Entrepoty.domain.entities.DomainError
import org.springframework.web.multipart.MultipartFile

data class CreatedFile(var url: String);
interface SaveFileUsecase {
    fun saveFile(file: MultipartFile, extension: String): Either<DomainError, CreatedFile>;
}