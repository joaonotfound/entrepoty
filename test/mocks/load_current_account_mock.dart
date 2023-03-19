import 'package:mocktail/mocktail.dart';

import 'package:entrepoty/domain/domain.dart';

class MockLoadCurrentAccount extends Mock implements LoadCurrentAccountUsecase {
  When _mockLoadCall() => when(
        () => load(),
      );
  void mockLoad(TokenAccount? data) =>
      _mockLoadCall().thenAnswer((invocation) async => data);
  void mockLoadError(dynamic error) => _mockLoadCall().thenThrow(error);
}
