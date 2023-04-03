import 'product_entity.dart';

// class BorrowStockItemEntity extends ProductEntity {
//   final int quantity;
//   const BorrowStockItemEntity({
//     required this.quantity,
//     required super.model,
//     required super.receiptUrl,
//   });
// }

class BorrowEntity {
  final String customerId;
  final String customerName;
  final String cc;
  final String chamadoNumber;
  final String returnDate;
  final String notes;
  final List<dynamic> items;
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
