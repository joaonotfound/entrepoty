import 'package:entrepoty/main/factories/pages/stock/stock.dart';
import 'package:entrepoty/ui/screens/screens.dart';

StockScreen makeStockScreen() {
  return StockScreen(presenter: makeStreamStockPresenter());
}
