import 'package:entrepoty/domain/entities/category_entity.dart';
import 'package:entrepoty/domain/usecases/usecases.dart';

class MockedLoadCategories implements LoadCategoriesUsecase {
  final List<String> categories = [
    "teclado",
    "mouse",
    "headsets",
    "mousepads",
    "carregadores",
    "fontes"
  ];
  @override
  Future<List<CategoryEntity>> load() async {
    return categories
        .map((category) => CategoryEntity(name: category, models: []))
        .toList();
  }
}
