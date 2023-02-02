import '../../../../ui/ui.dart';
import 'getx_register_item_presenter_factory.dart';

RegisterItemScreen makeRegisterItemScreen() {
  var presenter = makeGetxRegisterItemPresenter();
  return RegisterItemScreen(presenter: presenter);
}
