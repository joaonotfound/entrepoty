import 'package:service_desk_2/domain/entities/category_entity.dart';
import 'package:service_desk_2/domain/entities/stock_item_entity.dart';

abstract class StockPresenter {
  Stream<List<CategoryEntity>> get categoriesStream;
  Stream<List<StockItemEntity>> get itemsStream;
  Future<void> loadScreen();
  void dispose();
}
