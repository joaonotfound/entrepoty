import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/domain/entities/category_entity.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';

class MockLoadCategories extends Mock implements LoadCategoriesUsecase {
  When _mockLoadCall() => when(() => load());
  void mockLoad(List<CategoryEntity> data) =>
      _mockLoadCall().thenAnswer((_) async => data);
  void mockError(dynamic error) => _mockLoadCall().thenThrow(error);
}
