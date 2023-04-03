package com.entrepoty.Entrepoty.presentation.controllers

import com.entrepoty.Entrepoty.data.usecase.CustomerService
import com.entrepoty.Entrepoty.domain.entities.Customer
import com.entrepoty.Entrepoty.domain.entities.RemoveCustomerModel
import com.entrepoty.Entrepoty.presentation.helpers.ResponseUtils
import org.hibernate.Remove
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PatchMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/v1/customers")
class CustomerController {
    @Autowired
    private lateinit var customerService: CustomerService;

    @Autowired
    private lateinit var utils: ResponseUtils

    @GetMapping
    fun loadCustomers(): ResponseEntity<List<Customer>> {
        return ResponseEntity.ok(customerService.loadCustomers());
    };

    @PostMapping
    fun createCustomer(@RequestBody body: Customer): ResponseEntity<Customer> {
        return customerService.createCustomer(body).fold(
            { error -> utils.fromDomain(error) },
            { accounts -> ResponseEntity.ok(accounts) }
        )
    }
    @DeleteMapping
    fun deleteCustomer(@RequestBody body: RemoveCustomerModel): ResponseEntity<Customer> {
        return customerService.removeCustomer(body.enrollment).fold(
            { domainError ->  utils.fromDomain(domainError)},
            { account -> ResponseEntity.ok(account)}
        )
    }
}

