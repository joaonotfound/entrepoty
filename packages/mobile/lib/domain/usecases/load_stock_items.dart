import 'package:entrepoty/domain/entities/product_entity.dart';

abstract class LoadStockItemsUsecase {
  Future<List<ProductEntity>> loadAllItems();
}
