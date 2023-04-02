import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/presentation.dart';

class GetxCustomerListPresenter extends GetxController
    with GetxUiErrorManager, GetxLoadingManager
    implements CustomerListPresenter {
  final LoadCustomersUsecase loadCustomersUsecase;
  final customers = Rx<List<CustomerEntity>>([]);

  GetxCustomerListPresenter({
    required this.loadCustomersUsecase,
  });

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
