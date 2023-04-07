import '../domain.dart';

abstract class LoadCustomersUsecase {
  Future<List<CustomerEntity>> loadCustomers();
}
