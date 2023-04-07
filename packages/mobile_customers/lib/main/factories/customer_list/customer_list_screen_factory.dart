import '../../../ui/screens/screens.dart';
import 'customer_list.dart';

CustomerListScreen makeCustomerListScreen() {
  return CustomerListScreen(
    presenter: makeGetxUserListPresenter(),
  );
}
