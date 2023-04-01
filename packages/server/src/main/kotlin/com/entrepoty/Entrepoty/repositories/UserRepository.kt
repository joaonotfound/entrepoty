package com.entrepoty.Entrepoty.repositories

import com.entrepoty.Entrepoty.entities.User
import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface UserRepository : JpaRepository<User, Long>{
    fun findByUsername(username: String): Optional<User>;
}