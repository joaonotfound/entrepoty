class ProductModelEntity {
  final int id;
  final String name;
  const ProductModelEntity({
    this.id = 0,
    required this.name,
  });

  factory ProductModelEntity.fromJson(Map json) => ProductModelEntity(
        name: json["name"] ?? "",
        id: json['id'] ?? 0,
      );
}
