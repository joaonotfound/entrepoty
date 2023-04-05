package com.entrepoty.Entrepoty.data.usecase

import arrow.core.Either
import arrow.core.right
import com.entrepoty.Entrepoty.domain.entities.DomainError
import com.entrepoty.Entrepoty.domain.usecase.CreatedFile
import com.entrepoty.Entrepoty.domain.usecase.SaveFileUsecase
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.web.multipart.MultipartFile
import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import java.util.UUID

@Service
class FileService : SaveFileUsecase {

    var public_folder = "/public/"
    override fun saveFile(file: MultipartFile, extension: String): Either<DomainError, CreatedFile> {
        var file_path = public_folder + UUID.randomUUID().toString() + extension
        Files.write(Paths.get(file_path ), file.bytes);
        File(file_path).setReadable(true, false)

        return Either.Right(CreatedFile(file_path));
    }
}