import '../../domain/domain.dart';

class CategoryEntity {
  final String name;
  final List<StockItemModelEntity> models;
  const CategoryEntity({
    required this.name,
    required this.models,
  });

  factory CategoryEntity.fromJson(Map json) => CategoryEntity(
        name: json["name"],
        models: (json["models"].cast() as List)
            .map((model) => StockItemModelEntity(name: model["name"]))
            .toList(),
      );
}
