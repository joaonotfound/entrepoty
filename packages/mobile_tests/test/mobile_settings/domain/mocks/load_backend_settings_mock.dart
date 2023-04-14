import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';
import 'package:mobile_settings/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockLoadBackendSettings extends Mock
    implements LoadCurrentBackendSettings {
  When _mockLoadCall() => when(() => loadCurrentBackendSettings());

  void mockLoad(Either<DomainError, BackendSettings> response) =>
      _mockLoadCall().thenAnswer((inv) async => response);
}
