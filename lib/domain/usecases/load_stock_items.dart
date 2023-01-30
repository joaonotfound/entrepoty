import 'package:service_desk_2/domain/entities/stock_item_entity.dart';

abstract class LoadStockItemsUsecase {
  Future<List<StockItemEntity>> loadAllItems();
}
