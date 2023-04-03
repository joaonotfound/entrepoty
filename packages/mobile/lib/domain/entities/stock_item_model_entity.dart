class ProductModelEntity {
  final String name;
  const ProductModelEntity({
    required this.name,
  });

  factory ProductModelEntity.fromJson(Map json) => ProductModelEntity(
        name: json["name"],
      );
}
