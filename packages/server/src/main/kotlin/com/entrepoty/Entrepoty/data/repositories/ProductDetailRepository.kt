package com.entrepoty.Entrepoty.data.repositories

import com.entrepoty.Entrepoty.domain.entities.ProductDetailEntity
import org.springframework.data.jpa.repository.JpaRepository

interface ProductDetailRepository : JpaRepository<ProductDetailEntity, Long> {
}