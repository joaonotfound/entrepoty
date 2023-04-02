import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presentation.dart';

GetxCustomerListPresenter makeGetxUserListPresenter() {
  return GetxCustomerListPresenter(
      loadCustomersUsecase: makeMockedLoadCustomers());
}
