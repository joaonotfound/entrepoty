class CreateStockItemEntity {
  final String description;
  final int quantity;
  final String modelo;
  final String notes;
  const CreateStockItemEntity({
    required this.description,
    required this.quantity,
    required this.modelo,
    required this.notes,
  });
}
