package com.entrepoty.Entrepoty.domain.entities

import jakarta.persistence.*
import org.jetbrains.annotations.NotNull
import java.util.Date

@Entity
@Table(name = "borrow")
class BorrowEntity {

    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

    @field:NotNull
    @field:ManyToOne
    lateinit var customer: Customer

    @field:NotNull
    @field:OneToOne
    lateinit var product: ProductEntity

    @field:NotNull
    @field:Temporal(TemporalType.DATE)
    lateinit var datetime: java.sql.Date

    constructor(customer: Customer, product: ProductEntity, datetime: java.sql.Date){
        this.customer = customer
        this.product = product
        this.datetime = datetime
    };
}