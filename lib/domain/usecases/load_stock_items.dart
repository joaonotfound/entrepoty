import 'package:entrepoty/domain/entities/stock_item_entity.dart';

abstract class LoadStockItemsUsecase {
  Future<List<StockItemEntity>> loadAllItems();
}
