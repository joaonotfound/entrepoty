class StockItemEntity {
  final String description;
  final String model;
  final String notes;
  final String imageUrl;
  final String receiptUrl;
  const StockItemEntity({
    required this.description,
    required this.model,
    required this.notes,
    required this.imageUrl,
    required this.receiptUrl,
  });
}
