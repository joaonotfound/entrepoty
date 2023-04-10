package com.entrepoty.Entrepoty.domain.entities

class LoadUniqueProductResponse(productEntity: ProductEntity, var details: List<ProductDetailEntity>) {
    var product: ProductEntity = productEntity

}