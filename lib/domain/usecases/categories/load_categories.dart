import '../../../domain/domain.dart';

abstract class LoadCategoriesUsecase {
  Future<List<CategoryEntity>> load();
}
