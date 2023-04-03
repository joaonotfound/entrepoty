import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/main.dart';
import 'package:entrepoty/presentation/presentation.dart';

GetxCustomerListPresenter makeGetxUserListPresenter() {
  return GetxCustomerListPresenter(
    loadCustomersUsecase: RemoteLoadCustomers(
      client: makeHttpAdapter(),
      url: BackendUrls.customers,
    ),
  );
}
