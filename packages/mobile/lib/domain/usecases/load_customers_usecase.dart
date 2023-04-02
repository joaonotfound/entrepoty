import 'package:entrepoty/domain/domain.dart';

abstract class LoadCustomersUsecase {
  Future<List<CustomerEntity>> loadCustomers();
}
