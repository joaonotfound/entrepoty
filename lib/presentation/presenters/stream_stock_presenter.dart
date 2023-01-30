import 'dart:async';

import 'package:service_desk_2/domain/entities/entities.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class StreamStockPresenter implements StockPresenter {
  final LoadCategoriesUsecase loadCategories;
  // ignore: close_sinks
  final categoriesController =
      StreamController<List<CategoryEntity>>.broadcast();

  StreamStockPresenter({
    required this.loadCategories,
  });

  @override
  Stream<List<CategoryEntity>> get categoriesStream =>
      categoriesController.stream.distinct();

  @override
  Stream<List<StockItemEntity>> get itemsStream => throw UnimplementedError();

  @override
  Future<void> loadScreen() async {
    var categories = await loadCategories.load();
    categoriesController.add(categories);
  }

  @override
  void dispose() {
    categoriesController.close();
  }
}
