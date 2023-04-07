import '../../../ui/screens/screens.dart';
import 'stream_stock_list_presenter_factory.dart';

StockListScreen makeStockListScreen() {
  return StockListScreen(presenter: makeStreamStockListPresenter());
}
