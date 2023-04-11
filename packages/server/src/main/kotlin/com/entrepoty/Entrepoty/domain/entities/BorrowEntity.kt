package com.entrepoty.Entrepoty.domain.entities

import jakarta.persistence.*
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import org.jetbrains.annotations.NotNull

@Entity
@Table(name = "borrow")
class BorrowEntity {

    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

    @field:NotNull
    @field:ManyToOne
    @field:OnDelete(action = OnDeleteAction.CASCADE)
    lateinit var customer: Customer

    @field:NotNull
    @field:OneToOne
    @field:OnDelete(action = OnDeleteAction.CASCADE)
    lateinit var product: ProductDetailEntity

    @field:ManyToOne
    @field:OnDelete(action = OnDeleteAction.NO_ACTION)
    lateinit var createdBy: User

    @field:NotNull
    @field:Temporal(TemporalType.DATE)
    lateinit var datetime: java.sql.Date

    constructor(customer: Customer, product: ProductDetailEntity, datetime: java.sql.Date, createdBy: User){
        this.customer = customer
        this.product = product
        this.datetime = datetime
        this.createdBy = createdBy
    };
}