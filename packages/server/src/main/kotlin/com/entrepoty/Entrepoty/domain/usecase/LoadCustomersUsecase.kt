package com.entrepoty.Entrepoty.domain.usecase

import com.entrepoty.Entrepoty.domain.entities.Customer

interface LoadCustomersUsecase {
    fun loadCustomers(): List<Customer>;
}