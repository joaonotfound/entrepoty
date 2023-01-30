import 'package:service_desk_2/domain/usecases/usecases.dart';

class MockedRegisterLot implements RegisterLot {
  @override
  Future<void> registerLot({required List<RegisterLot> items}) async {}
}
