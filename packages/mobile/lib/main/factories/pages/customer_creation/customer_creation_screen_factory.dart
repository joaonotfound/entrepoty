import 'package:entrepoty/main/factories/pages/customer_creation/customer_creation.dart';
import 'package:entrepoty/ui/ui.dart';

CustomerCreationScreen makeCustomerCreationScreen() {
  return CustomerCreationScreen(
    presenter: makeGetxCustomerPresenter(),
  );
}
