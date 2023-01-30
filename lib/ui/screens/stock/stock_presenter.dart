import 'package:service_desk_2/domain/entities/category_entity.dart';
import 'package:service_desk_2/domain/entities/stock_item_entity.dart';

abstract class StockPresenter {
  Stream<CategoryEntity> get categoriesStream;
  Stream<StockItemEntity> get itemsStream;
  Future<void> loadScreen();
}
