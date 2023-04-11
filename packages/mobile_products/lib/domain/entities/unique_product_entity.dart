import 'package:mobile_products/domain/domain.dart';
import 'package:mobile_products/domain/entities/ProductDetailEntity.dart';
import 'package:mobile_products_model/domain/domain.dart';

class UniqueProductEntity {
  ProductModelEntity product;
  List<ProductDetailEntity> details;

  UniqueProductEntity({required this.product, required this.details});

  factory UniqueProductEntity.fromJson(Map json) {
    final List<dynamic> details = json['details'];
    return UniqueProductEntity(
        product: ProductModelEntity.fromJson(json['product']),
        details: details.map(
              (detail) => ProductDetailEntity.fromJson(detail),
        ).toList(),
      ); }
}
