import 'package:entrepoty/main/factories/pages/stock/stock.dart';
import 'package:entrepoty/ui/screens/screens.dart';

StockListScreen makeStockScreen() {
  return StockListScreen(presenter: makeStreamStockPresenter());
}
