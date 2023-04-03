package com.entrepoty.Entrepoty.data.repositories

import com.entrepoty.Entrepoty.domain.entities.Customer
import org.springframework.data.jpa.repository.JpaRepository

interface CustomersRepository : JpaRepository<Customer, Long> {
}