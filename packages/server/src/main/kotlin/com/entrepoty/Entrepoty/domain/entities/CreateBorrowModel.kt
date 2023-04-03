package com.entrepoty.Entrepoty.domain.entities

import java.sql.Date

data class CreateBorrowModel (var customer: Long, var product: Long, var date: Date);