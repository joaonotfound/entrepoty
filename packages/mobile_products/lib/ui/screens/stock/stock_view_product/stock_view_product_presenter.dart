import 'package:mobile_products/domain/domain.dart';

abstract class StockViewProductPresenter {
  Stream<UniqueProductEntity?> get productStream;

  Future<void> loadProduct(int id);
}
