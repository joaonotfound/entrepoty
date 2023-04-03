package com.entrepoty.Entrepoty.data.repositories

import com.entrepoty.Entrepoty.domain.entities.Customer
import org.springframework.data.jpa.repository.JpaRepository
import java.util.Optional

interface CustomersRepository : JpaRepository<Customer, Long> {
    fun findByEnrollment(enrollment: String): Optional<Customer>;
}