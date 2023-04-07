import 'package:mobile_customers/domain/domain.dart';

abstract class CustomerViewPresenter {
  Stream<bool> get isLoadingStream;
  Stream<CustomerEntity?> get customerStream;

  Future<void> loadCustomer(String enrollment);

  Future<void> deleteCustomer(String enrollment);
}
