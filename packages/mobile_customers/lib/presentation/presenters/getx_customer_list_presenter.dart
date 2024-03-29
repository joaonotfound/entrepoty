import 'package:get/get.dart';

import 'package:mobile_core/mobile_core.dart';

import '../../domain/domain.dart';
import '../../mobile_customers.dart';

class GetxCustomerListPresenter extends GetxController
    with GetxUiErrorManager, GetxLoadingManager
    implements CustomerListPresenter {
  final LoadCustomersUsecase loadCustomersUsecase;
  final RemoveCustomerUsecase removeCustomer;
  final customers = Rx<List<CustomerEntity>>([]);

  GetxCustomerListPresenter({
    required this.loadCustomersUsecase,
    required this.removeCustomer,
  });

  @override
  Future<void> deleteCustomer(String enrollment) async {
    final response = await removeCustomer.deleteCustomer(enrollment);
    if (response.isRight()) {
      await loadCustomers();
    }
  }

  @override
  Future<void> loadCustomers() async {
    try {
      isLoading = true;
      final fetchedCustomers = await loadCustomersUsecase.loadCustomers();
      customers.value = fetchedCustomers;
    } catch (_) {
      mainError = UiError.unexpected;
    }

    isLoading = false;
  }

  @override
  Stream<List<CustomerEntity>?> get customersStream => customers.stream;
}
