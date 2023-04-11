import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_products/domain/domain.dart';

import 'employer_entity.dart';

class BorrowEntity {
  int id;
  CustomerEntity customer;
  ProductEntity product;
  DateTime date;
  Employer createdBy;

  BorrowEntity(
      {required this.id,
      required this.customer,
      required this.product,
      required this.date,
      required this.createdBy});

  factory BorrowEntity.fromJson(Map json) => BorrowEntity(
      id: json['id'] ?? 0,
      customer: CustomerEntity.fromJson(json['customer'] ?? {}),
      product: ProductEntity.fromJson(json['product'] ?? {}),
      date: DateTime.parse(
        json['datetime'],
      ),
      createdBy: Employer.fromJson(json['createdBy']));
}
