import 'package:entrepoty/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entrepoty/presentation/presentation.dart';

import '../../data/usecases/remote_customer/remove_customer_mock.dart';
import '../../domain/domain.dart';

void main() {
  late MockLoadCustomers loadCustomers;
  late GetxCustomerListPresenter sut;
  late RemoveCustomerMock removeCusomer;
  setUp(() {
    loadCustomers = MockLoadCustomers();
    loadCustomers.mockLoadCustomers([]);
    removeCusomer = RemoveCustomerMock();
    sut = GetxCustomerListPresenter(
      loadCustomersUsecase: loadCustomers,
      removeCustomer: removeCusomer,
    );
  });
  group("GetxCustomersPresenter", () {
    test("should emit customers when calling loadCustomers", () async {
      sut.customersStream
          .listen(expectAsync1((customers) => expect(customers, [])));

      sut.loadCustomers();
    });
    test("should emit loading when calling loadCustomers", () async {
      expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

      sut.loadCustomers();
    });
    test("should emit error when loadCustomersUsecase throws", () async {
      loadCustomers.mockLoadCustomersError(Exception());
      sut.mainErrorStream
          .listen(expectAsync1((error) => expect(error, UiError.unexpected)));

      sut.loadCustomers();
    });
  });
}
