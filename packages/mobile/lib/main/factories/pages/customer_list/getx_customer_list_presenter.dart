import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/data/usecases/remove_customer/remote_remove_customer.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

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
