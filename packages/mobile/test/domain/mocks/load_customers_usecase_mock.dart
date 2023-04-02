import 'package:mocktail/mocktail.dart';
import 'package:entrepoty/domain/domain.dart';

class MockLoadCustomers extends Mock implements LoadCustomersUsecase {
  When _mockLoadCustomersCall() => when(
        () => loadCustomers(),
      );
  void mockLoadCustomers(List<CustomerEntity> data) =>
      _mockLoadCustomersCall().thenAnswer((invocation) async => data);
  void mockLoadCustomersError(dynamic error) =>
      _mockLoadCustomersCall().thenThrow(error);
}
