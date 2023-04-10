import 'package:mobile_products/mobile_products.dart';

StockViewProductScreen makeStockViewProductScreen() {
  return StockViewProductScreen(
    presenter: makeGetxStockViewProductPresenter(),
  );
}
