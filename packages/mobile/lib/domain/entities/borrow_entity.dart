import 'package:entrepoty/domain/domain.dart';

class BorrowEntity {
  int id;
  CustomerEntity customer;
  ProductEntity product;
  DateTime date;
  BorrowEntity({
    required this.id,
    required this.customer,
    required this.product,
    required this.date,
  });

  factory BorrowEntity.fromJson(Map json) => BorrowEntity(
        id: json['id'] ?? 0,
        customer: CustomerEntity.fromJson(json['customer'] ?? {}),
        product: ProductEntity.fromJson(json['product'] ?? {}),
        date: DateTime.parse(json['datetime']),
      );
}
