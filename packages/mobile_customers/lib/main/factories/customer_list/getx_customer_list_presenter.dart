import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../data/data.dart';
import '../../../mobile_customers.dart';

GetxCustomerListPresenter makeGetxUserListPresenter() {
  return GetxCustomerListPresenter(
    loadCustomersUsecase: RemoteLoadCustomers(
      client: makeHttpAdapter(),
      url: BackendUrls.customers,
    ),
    removeCustomer: makeRemoteRemoveCustomer(),
  );
}
