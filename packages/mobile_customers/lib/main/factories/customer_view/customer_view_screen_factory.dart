import 'package:mobile_customers/mobile_customers.dart';

CustomerViewScreen makeCustomerViewScreen() {
  return CustomerViewScreen(
    presenter: makeGetxCustomerViewPresenter(),
  );
}
