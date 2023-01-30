import 'dart:async';

import 'package:service_desk_2/domain/entities/entities.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class StreamStockPresenter implements StockPresenter {
  final LoadCategoriesUsecase loadCategories;
  final LoadStockItemsUsecase loadItems;
  // ignore: close_sinks
  final categoriesController =
      StreamController<List<CategoryEntity>>.broadcast();
  final itemsController = StreamController<List<StockItemEntity>>.broadcast();

  StreamStockPresenter({
    required this.loadCategories,
    required this.loadItems,
  });

  @override
  Stream<List<CategoryEntity>> get categoriesStream =>
      categoriesController.stream.distinct();

  @override
  Stream<List<StockItemEntity>> get itemsStream => itemsController.stream;

  @override
  Future<void> loadScreen() async {
    final categories = await loadCategories.load();
    categoriesController.add(categories);
    final items = await loadItems.loadAllItems();
    itemsController.add(items);
  }

  @override
  void dispose() {
    categoriesController.close();
    itemsController.close();
  }
}
