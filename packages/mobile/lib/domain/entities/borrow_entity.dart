import 'stock_item_entity.dart';

class BorrowStockItemEntity extends StockItemEntity {
  final int quantity;
  const BorrowStockItemEntity({
    required this.quantity,
    required super.description,
    required super.imageUrl,
    required super.model,
    required super.notes,
    required super.receiptUrl,
  });
}

class BorrowEntity {
  final String customerId;
  final String customerName;
  final String cc;
  final String chamadoNumber;
  final String returnDate;
  final String notes;
  final List<BorrowStockItemEntity> items;
  const BorrowEntity({
    required this.customerId,
    required this.customerName,
    required this.cc,
    required this.chamadoNumber,
    required this.returnDate,
    required this.notes,
    required this.items,
  });
}
