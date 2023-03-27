import 'package:entrepoty/data/cache/cache.dart';
import 'package:mocktail/mocktail.dart';

class SecureCacheStorageMock extends Mock implements SecureCacheStorage {
  When _mockSaveSecureCall() => when(
      () => saveSecure(key: any(named: "key"), value: any(named: "value")));
  void mockSaveSecure(dynamic data) =>
      _mockSaveSecureCall().thenAnswer((invocation) async => data);
  void mockSaveError(dynamic except) => _mockSaveSecureCall().thenThrow(except);

  When _mockLoadSecureCall() => when(() => loadSecure(key: any(named: "key")));
  void mockLoadSecure(String? data) =>
      _mockLoadSecureCall().thenAnswer((invocation) async => data);
  void mockLoadError(dynamic except) => _mockLoadSecureCall().thenThrow(except);
}
