import 'package:flutter/foundation.dart';

abstract class LoadCategoriesUsecase {
  Future<List<Category>> load();
}
