import 'dart:async';

import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../domain/domain.dart';
import '../../ui/screens/screens.dart';


class StreamStockListPresenter extends GetxController
    implements StockListPresenter {
  final LoadProductsUsecase loadItems;

  // ignore: close_sinks
  final categoriesController = StreamController<List<String>>.broadcast();
  final itemsController = StreamController<List<ProductEntity>>.broadcast();

  StreamStockListPresenter({
    required this.loadItems,
  });

  Stream<List<String>> get categoriesStream =>
      categoriesController.stream.distinct();

  Stream<List<ProductEntity>> get itemsStream => itemsController.stream;

  Future<List<String>> loadCategories() async {
    final categoryProvider = Get.find<CategoriesProvider>();
    final categories = categoryProvider.loadCategories();
    print('categories: ' + categories.toString());

    categoriesController.add(categories);
    return categories;
  }

  Future<void> loadScreen() async {
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
