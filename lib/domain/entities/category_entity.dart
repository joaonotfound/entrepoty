import 'package:service_desk_2/domain/domain.dart';

class CategoryEntity {
  final String name;
  final List<StockItemEntity> models;
  const CategoryEntity({
    required this.name,
    required this.models,
  });
}