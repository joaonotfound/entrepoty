import 'package:service_desk_2/domain/entities/category_entity.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';

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
