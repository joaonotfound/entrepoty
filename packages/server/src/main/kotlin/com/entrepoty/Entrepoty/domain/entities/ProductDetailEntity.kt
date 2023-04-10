package com.entrepoty.Entrepoty.domain.entities

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.OneToOne
import jakarta.persistence.Table
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import org.jetbrains.annotations.NotNull

@Entity
@Table(name = "product_detail")
class ProductDetailEntity {
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id:Long = 0

    @field:GeneratedValue(strategy = GenerationType.UUID)
    @field:NotNull
    lateinit var equity: String

    @field:OnDelete(action = OnDeleteAction.CASCADE)
    @field:OneToOne
    lateinit var product: ProductEntity
}