package com.entrepoty.Entrepoty.data.repositories

import com.entrepoty.Entrepoty.domain.entities.ProductDetailEntity
import com.entrepoty.Entrepoty.domain.entities.ProductEntity
import com.entrepoty.Entrepoty.domain.entities.ProductModelEntity
import org.springframework.data.jpa.repository.JpaRepository

interface ProductDetailRepository : JpaRepository<ProductDetailEntity, Long> {
    fun findByProduct(product: ProductModelEntity): List<ProductDetailEntity>;
}