package com.entrepoty.Entrepoty.domain.entities

import jakarta.persistence.*
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import org.jetbrains.annotations.NotNull

@Entity
@Table(name = "products")
class ProductEntity {
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

    @field:ManyToOne
    @field:OnDelete(action = OnDeleteAction.CASCADE)
    lateinit var model: ProductModelEntity

    @field:NotNull
    var quantity: Long = 0

    @field:NotNull
    var receipt_url: String = ""

    constructor(model: ProductModelEntity, quantity: Long, receipt_url: String){
        this.model = model
        this.quantity = quantity
        this.receipt_url = receipt_url
    }
}