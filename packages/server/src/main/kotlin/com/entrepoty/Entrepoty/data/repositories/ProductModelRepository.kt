package com.entrepoty.Entrepoty.data.repositories

import com.entrepoty.Entrepoty.domain.entities.ProductModelEntity
import org.springframework.data.jpa.repository.JpaRepository

interface ProductModelRepository : JpaRepository<ProductModelEntity, Long> {

}