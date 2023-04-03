package com.entrepoty.Entrepoty.domain.entities

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.Table
import org.jetbrains.annotations.NotNull

@Entity
@Table(name = "product_models")
class ProductModelEntity{
    @field:NotNull
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
     var id: Long = 0;

    @field:NotNull
     var name: String = "";

     @field:NotNull
     var image_path: String = "";

 }
