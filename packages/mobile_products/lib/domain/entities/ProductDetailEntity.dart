class ProductDetailEntity {
  String equity;

  ProductDetailEntity({required this.equity});

  factory ProductDetailEntity.fromJson(Map json) => ProductDetailEntity(equity: json['equity'] ?? "");
}
