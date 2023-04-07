import 'package:mobile_products_model/mobile_products_model.dart';

class ProductEntity {
  final int id;
  final ProductModelEntity model;
  final String receiptUrl;
  final int quantity;
  const ProductEntity({
    this.id = 0,
    required this.model,
    required this.receiptUrl,
    required this.quantity,
  });

  factory ProductEntity.fromJson(Map json) => ProductEntity(
        id: json['id'],
        model: ProductModelEntity.fromJson(json['model'] ?? {}),
        receiptUrl: json['receipt_url'] ?? 0,
        quantity: json['quantity'] ?? 0,
      );
}
