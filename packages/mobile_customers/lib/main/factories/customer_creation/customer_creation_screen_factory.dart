
import '../../../ui/ui.dart';
import 'customer_creation.dart';

CustomerCreationScreen makeCustomerCreationScreen() {
  return CustomerCreationScreen(
    presenter: makeGetxCustomerPresenter(),
  );
}
