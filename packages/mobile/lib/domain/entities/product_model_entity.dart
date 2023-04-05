class ProductModelEntity {
  final int id;
  final String name;
  final String category;
  final String imagePath;

  const ProductModelEntity({
    this.id = 0,
    required this.name,
    required this.category,
    this.imagePath = "",
  });

  factory ProductModelEntity.fromJson(Map json) => ProductModelEntity(
        name: json["name"] ?? "",
        id: json['id'] ?? 0,
        category: json['category'] ?? '',
        imagePath: json['image_path'],
      );
}
