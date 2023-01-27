import 'dart:ffi';

import 'stock_item_entity.dart';

class LoanStockItemEntity extends StockItemEntity {
  final Int quantity;
  const LoanStockItemEntity({
    required this.quantity,
    required super.description,
    required super.imageUrl,
    required super.model,
    required super.notes,
    required super.receiptUrl,
  });
}

class LoanEntity {
  final String customerId;
  final String customerName;
  final String cc;
  final String chamadoNumber;
  final String returnDate;
  final String notes;
  final List<LoanStockItemEntity> items;
  const LoanEntity({
    required this.customerId,
    required this.customerName,
    required this.cc,
    required this.chamadoNumber,
    required this.returnDate,
    required this.notes,
    required this.items,
  });
}
