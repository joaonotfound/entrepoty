import 'package:service_desk_2/domain/domain.dart';

abstract class LoadCategoriesUsecase {
  Future<List<CategoryEntity>> load();
}
