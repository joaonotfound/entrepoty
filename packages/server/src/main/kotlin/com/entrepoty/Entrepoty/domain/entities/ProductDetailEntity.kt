package com.entrepoty.Entrepoty.domain.entities

import jakarta.persistence.*
import org.hibernate.annotations.GenericGenerator
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.util.*

@Entity
@Table(name = "product_detail")
class ProductDetailEntity {
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id:Long = 0

    @field:GeneratedValue(generator = "uuid2")
    @field:GenericGenerator(name = "uuid2", strategy = "uuid2")
    @field:Column(unique = true)
    var equity = UUID.randomUUID();

    @field:OnDelete(action = OnDeleteAction.CASCADE)
    @field:ManyToOne
    lateinit var product: ProductEntity
}