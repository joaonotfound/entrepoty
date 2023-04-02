package com.entrepoty.Entrepoty.domain.entities

import jakarta.persistence.*
import org.jetbrains.annotations.NotNull

@Entity
@Table(name = "customers")
class Customer {
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

    @field:Column(unique = true)
    @field:NotNull
    var enrollment: String = ""

    var name: String = ""
    var email: String = ""
    var setor: String = ""
}