import '../../../../ui/ui.dart';
import 'getx_stock_item_creation_presenter_factory.dart';

StockItemCreationScreen makeStockItemCreationScreen() {
  var presenter = makeGetxStockItemCreationPresenter();
  return StockItemCreationScreen(presenter: presenter);
}
