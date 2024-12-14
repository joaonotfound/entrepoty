import 'package:mobile_customers/mobile_customers.dart';
import 'package:mocktail/mocktail.dart';

class MockLoadCustomers extends Mock implements LoadCustomersUsecase {
  When _mockLoadCustomersCall() => when(
        () => loadCustomers(),
      );
  void mockLoadCustomers(List<CustomerEntity> data) =>
      _mockLoadCustomersCall().thenAnswer((invocation) async => data);
  void mockLoadCustomersError(error) =>
      _mockLoadCustomersCall().thenThrow(error);
}
