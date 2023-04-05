class ProductModelEntity {
  final int id;
  final String name;
  final String imagePath;

  const ProductModelEntity({
    this.id = 0,
    required this.name,
    this.imagePath = "",
  });

  factory ProductModelEntity.fromJson(Map json) => ProductModelEntity(
        name: json["name"] ?? "",
        id: json['id'] ?? 0,
        imagePath: json['image_path'],
      );
}
