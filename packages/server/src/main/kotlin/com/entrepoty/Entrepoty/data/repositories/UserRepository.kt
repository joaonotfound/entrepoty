package com.entrepoty.Entrepoty.data.repositories

import com.entrepoty.Entrepoty.domain.entities.User
import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface UserRepository : JpaRepository<User, Long>{
    fun findByUsername(username: String): Optional<User>;
}