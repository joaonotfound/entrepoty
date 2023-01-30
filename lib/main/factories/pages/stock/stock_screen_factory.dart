import 'package:service_desk_2/main/factories/pages/stock/stock.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

StockScreen makeStockScreen() {
  return StockScreen(presenter: makeStreamStockPresenter());
}
