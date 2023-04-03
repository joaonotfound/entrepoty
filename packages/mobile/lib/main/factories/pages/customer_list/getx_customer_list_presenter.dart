import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/data/usecases/remove_customer/remote_remove_customer.dart';
import 'package:entrepoty/main/main.dart';
import 'package:entrepoty/presentation/presentation.dart';

GetxCustomerListPresenter makeGetxUserListPresenter() {
  return GetxCustomerListPresenter(
      loadCustomersUsecase: RemoteLoadCustomers(
        client: makeHttpAdapter(),
        url: BackendUrls.customers,
      ),
      removeCustomer: RemoteRemoveCustomer(
        client: makeHttpAdapter(),
        url: BackendUrls.customers,
      ));
}
