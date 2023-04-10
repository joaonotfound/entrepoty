import 'package:mobile_products/domain/domain.dart';
import 'package:mobile_products/domain/entities/ProductDetailEntity.dart';

class UniqueProductEntity {
  ProductEntity product;
  List<ProductDetailEntity> details;

  UniqueProductEntity({required this.product, required this.details});

  factory UniqueProductEntity.fromJson(Map json) => UniqueProductEntity(
        product: ProductEntity.fromJson(json['product']),
        details: [],
      );
}
