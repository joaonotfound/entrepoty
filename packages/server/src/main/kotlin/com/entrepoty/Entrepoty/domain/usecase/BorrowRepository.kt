package com.entrepoty.Entrepoty.domain.usecase

import com.entrepoty.Entrepoty.domain.entities.BorrowEntity
import org.springframework.data.jpa.repository.JpaRepository

interface BorrowRepository : JpaRepository<BorrowEntity, Long> {

}