import 'package:entrepoty/domain/domain.dart';

class ProductEntity {
  final ProductModelEntity model;
  final String receiptUrl;
  final int quantity;
  const ProductEntity({
    required this.model,
    required this.receiptUrl,
    required this.quantity,
  });

  factory ProductEntity.fromJson(Map json) => ProductEntity(
        model: ProductModelEntity.fromJson(json['model'] ?? {}),
        receiptUrl: json['receipt_url'] ?? 0,
        quantity: json['quantity'] ?? 0,
      );
}
