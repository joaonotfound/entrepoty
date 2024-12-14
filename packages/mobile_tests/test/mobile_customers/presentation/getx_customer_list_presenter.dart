import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_customers/mobile_customers.dart';

import '../data/mocks/remove_customer_mock.dart';
import '../domain/domain.dart';

void main() {
  late MockLoadCustomers loadCustomers;
  late GetxCustomerListPresenter sut;
  late RemoveCustomerMock removeCustomer;
  setUp(() {
    loadCustomers = MockLoadCustomers();
    loadCustomers.mockLoadCustomers([]);
    removeCustomer = RemoveCustomerMock();
    sut = GetxCustomerListPresenter(
      loadCustomersUsecase: loadCustomers,
      removeCustomer: removeCustomer,
    );
  });
  group('GetxCustomersPresenter', () {
    test('should emit customers when calling loadCustomers', () async {
      sut.customersStream
          .listen(expectAsync1((customers) => expect(customers, [])));

      sut.loadCustomers();
    });
    test('should emit loading when calling loadCustomers', () async {
      expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

      sut.loadCustomers();
    });
    test('should emit error when loadCustomersUsecase throws', () async {
      loadCustomers.mockLoadCustomersError(Exception());
      sut.mainErrorStream
          .listen(expectAsync1((error) => expect(error, UiError.unexpected)));

      sut.loadCustomers();
    });
  });
}
