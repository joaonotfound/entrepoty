import 'package:mobile_products_model/domain/domain.dart';

class ProductDetailWithProduct {
  String equity;
  ProductModelEntity product;

  ProductDetailWithProduct({
    required this.product,
    required this.equity,
  });

  factory ProductDetailWithProduct.fromJson(Map json) =>
      ProductDetailWithProduct(
        product: ProductModelEntity.fromJson(json['product']),
        equity: json['equity'] ?? "",
      );
}
