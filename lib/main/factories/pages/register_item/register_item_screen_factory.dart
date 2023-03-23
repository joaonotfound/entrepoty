import '../../../../ui/ui.dart';
import 'getx_register_item_presenter_factory.dart';

StockItemCreationScreen makeRegisterItemScreen() {
  var presenter = makeGetxRegisterItemPresenter();
  return StockItemCreationScreen(presenter: presenter);
}
