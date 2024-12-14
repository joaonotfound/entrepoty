import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_customers/mobile_customers.dart';

class GetxCustomerViewPresenter extends GetxController
    with GetxLoadingManager
    implements CustomerViewPresenter {
  LoadUniqueCustomerUsecase loadUniqueCustomerUsecase;
  RemoveCustomerUsecase removeCustomerUsecase;

  final Rx<CustomerEntity?> _customer = Rx(null);

  @override
  Stream<CustomerEntity?> get customerStream => _customer.stream;

  GetxCustomerViewPresenter({
    required this.loadUniqueCustomerUsecase,
    required this.removeCustomerUsecase,
  });

  @override
  Future<void> deleteCustomer(String enrollment) async {
    isLoading = true;
    final response = await removeCustomerUsecase.deleteCustomer(enrollment);
    isLoading = false;
    Get.back();
  }

  @override
  Future<void> loadCustomer(String enrollment) async {
    isLoading = true;
    final response =
        await loadUniqueCustomerUsecase.loadUniqueCustomer(enrollment);
    response.fold((error) {}, (customer) {
      _customer.value = customer;
    });
    isLoading = false;
  }
}
