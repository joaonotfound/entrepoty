package com.entrepoty.Entrepoty.data.repositories

import com.entrepoty.Entrepoty.domain.entities.ProductEntity
import org.springframework.data.jpa.repository.JpaRepository

interface ProductRepository : JpaRepository<ProductEntity, Long> {
}