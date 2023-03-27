import 'package:mocktail/mocktail.dart';
import 'package:entrepoty/domain/entities/category_entity.dart';
import 'package:entrepoty/domain/usecases/usecases.dart';

class MockLoadCategories extends Mock implements LoadCategoriesUsecase {
  When _mockLoadCall() => when(() => load());
  void mockLoad(List<CategoryEntity> data) =>
      _mockLoadCall().thenAnswer((_) async => data);
  void mockError(dynamic error) => _mockLoadCall().thenThrow(error);
}
