import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

class SecureCacheStorageMock extends Mock implements SecureCacheStorage {
  When _mockSaveSecureCall() => when(
      () => saveSecure(key: any(named: 'key'), value: any(named: 'value')),);
  void mockSaveSecure(data) =>
      _mockSaveSecureCall().thenAnswer((invocation) async => data);
  void mockSaveError(except) => _mockSaveSecureCall().thenThrow(except);

  When _mockLoadSecureCall() => when(() => loadSecure(key: any(named: 'key')));
  void mockLoadSecure(String? data) =>
      _mockLoadSecureCall().thenAnswer((invocation) async => data);
  void mockLoadError(except) => _mockLoadSecureCall().thenThrow(except);
}
