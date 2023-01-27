import 'dart:ffi';

import './stock_item_model.dart';

class LoanStockItemModel extends StockItemModel {
  final Int quantity;
  const LoanStockItemModel({
    required this.quantity,
    required super.description,
    required super.imageUrl,
    required super.model,
    required super.notes,
    required super.receiptUrl,
  });
}

class LoanModel {
  final String customerId;
  final String customerName;
  final String cc;
  final String chamadoNumber;
  final String returnDate;
  final String notes;
  final List<LoanStockItemModel> items;
  const LoanModel({
    required this.customerId,
    required this.customerName,
    required this.cc,
    required this.chamadoNumber,
    required this.returnDate,
    required this.notes,
    required this.items,
  });
}
