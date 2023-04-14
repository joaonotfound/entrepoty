import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

class MockLoadSecureCacheStorage extends Mock
    implements LoadSecureCacheStorage {
  When _mockLoadSecureCall() => when(() => loadSecure(key: any(named: "key")));
  void mockLoadSecure(String? data) =>
      _mockLoadSecureCall().thenAnswer((invocation) async => data);
  void mockLoadError(dynamic except) => _mockLoadSecureCall().thenThrow(except);
}
