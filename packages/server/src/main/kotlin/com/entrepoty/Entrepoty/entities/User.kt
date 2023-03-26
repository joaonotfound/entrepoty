package com.entrepoty.Entrepoty.entities

import jakarta.persistence.Column
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType

import jakarta.persistence.Entity
import jakarta.persistence.Id
import jakarta.persistence.Table
import org.jetbrains.annotations.NotNull

@Entity
@Table(name = "users")
class User {
    @field:Id
    @field:GeneratedValue(strategy = GenerationType.AUTO)
    var id: Long = 0

    @field:Column(unique = true)
    @field:NotNull
    var username: String = ""

    @field:NotNull
    var password: String = ""

    // 0 = readonly
    // 1 = employer
    // 2 = administrator
    @field:NotNull
    var permissionLevel: Short = 0;
}