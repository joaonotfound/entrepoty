import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/ui/screens/screens.dart';

CustomerListScreen makeCustomerListScreen() {
  return CustomerListScreen(
    presenter: makeGetxUserListPresenter(),
  );
}
