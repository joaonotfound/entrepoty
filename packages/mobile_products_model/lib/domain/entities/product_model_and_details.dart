import 'package:mobile_products/domain/domain.dart';
import 'package:mobile_products_model/domain/domain.dart';

class ProductModelAndDetails {
  ProductModelEntity product;
  List<ProductDetailEntity> details;

  ProductModelAndDetails({
    required this.product,
    required this.details,
  });

  factory ProductModelAndDetails.fromJson(Map json) {
    final List<dynamic> details = json['details'] ?? [];
    return ProductModelAndDetails(
        product: ProductModelEntity.fromJson(json['product']),
        details: details.map(
              (detail) => ProductDetailEntity.fromJson(detail),
        ).toList()
    );
  }
}
