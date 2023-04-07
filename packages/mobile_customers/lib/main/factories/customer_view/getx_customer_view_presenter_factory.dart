import 'package:mobile_customers/mobile_customers.dart';

GetxCustomerViewPresenter makeGetxCustomerViewPresenter() {
  return GetxCustomerViewPresenter(
    removeCustomerUsecase: makeRemoteRemoveCustomer(),
    loadUniqueCustomerUsecase: makeRemoteLoadUniqueCustomer(),
  );
}
