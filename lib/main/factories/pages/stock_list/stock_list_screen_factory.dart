import 'package:entrepoty/main/factories/pages/stock_list/stock_list.dart';
import 'package:entrepoty/ui/screens/screens.dart';

StockListScreen makeStockListScreen() {
  return StockListScreen(presenter: makeStreamStockListPresenter());
}
