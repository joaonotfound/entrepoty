import 'package:mobile_products/domain/domain.dart';
import 'package:mobile_products/domain/entities/ProductDetailEntity.dart';
import 'package:mobile_products_model/domain/domain.dart' as models;

class UniqueProductEntity {
  models.ProductModelEntity product;
  List<ProductDetailEntity> details;

  UniqueProductEntity({required this.product, required this.details});

  factory UniqueProductEntity.fromJson(Map json) {
    final List<dynamic> details = json['details'];
    return UniqueProductEntity(
      product: models.ProductModelEntity.fromJson(json['product']),
      details: details
          .map(
            (detail) => ProductDetailEntity.fromJson(detail),
          )
          .toList(),
    );
  }
}
