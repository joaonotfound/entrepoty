import 'dart:async';

import 'package:get/get.dart';
import 'package:entrepoty/domain/entities/entities.dart';
import 'package:entrepoty/domain/usecases/usecases.dart';
import 'package:entrepoty/ui/screens/screens.dart';

class StreamStockListPresenter extends GetxController
    implements StockListPresenter {
  final LoadCategoriesUsecase loadCategories;
  final LoadStockItemsUsecase loadItems;
  // ignore: close_sinks
  final categoriesController =
      StreamController<List<CategoryEntity>>.broadcast();
  final itemsController = StreamController<List<ProductEntity>>.broadcast();

  StreamStockListPresenter({
    required this.loadCategories,
    required this.loadItems,
  });

  @override
  Stream<List<CategoryEntity>> get categoriesStream =>
      categoriesController.stream.distinct();

  @override
  Stream<List<ProductEntity>> get itemsStream => itemsController.stream;

  @override
  Future<void> loadScreen() async {
    final categories = await loadCategories.load();
    categoriesController.add(categories);
    final items = await loadItems.loadAllItems();
    itemsController.add(items);
  }

  @override
  void dispose() {
    super.dispose();
    categoriesController.close();
    itemsController.close();
  }
}
