package com.entrepoty.Entrepoty.repositories

import com.entrepoty.Entrepoty.entities.User
import org.springframework.data.jpa.repository.JpaRepository

interface UserRepository : JpaRepository<User, Long>{}