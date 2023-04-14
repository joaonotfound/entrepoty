import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

class MockLoadCurrentAccount extends Mock implements LoadCurrentAccountUsecase {
  When _mockLoadCall() => when(
        () => load(),
      );
  void mockLoad(TokenAccount? data) =>
      _mockLoadCall().thenAnswer((invocation) async => data);
  void mockLoadError(dynamic error) => _mockLoadCall().thenThrow(error);
}
