import 'dart:async';

import 'package:get/get.dart';
import 'package:entrepoty/domain/entities/entities.dart';
import 'package:entrepoty/domain/usecases/usecases.dart';
import 'package:entrepoty/ui/screens/screens.dart';

class StreamStockListPresenter extends GetxController
    implements StockListPresenter {
  final LoadCategoriesUsecase loadCategories;
  final LoadProductsUsecase loadItems;
  // ignore: close_sinks
  final categoriesController =
      StreamController<List<CategoryEntity>>.broadcast();
  final itemsController = StreamController<List<ProductEntity>>.broadcast();

  StreamStockListPresenter({
    required this.loadCategories,
    required this.loadItems,
  });

  Stream<List<CategoryEntity>> get categoriesStream =>
      categoriesController.stream.distinct();

  Stream<List<ProductEntity>> get itemsStream => itemsController.stream;

  Future<void> loadScreen() async {
    final categories = await loadCategories.load();
    categoriesController.add(categories);
    final response = await loadItems.loadProducts();
    response.fold((l) {}, (items) {
      itemsController.add(items);
      Get.back();
    });
  }

  void dispose() {
    super.dispose();
    categoriesController.close();
    itemsController.close();
  }
}
