import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

class MockSaveSecureCacheStorage extends Mock
    implements SaveSecureCacheStorage {
  When _mockSaveSecureCall() => when(
      () => saveSecure(key: any(named: "key"), value: any(named: "value")));
  void mockSaveSecure(dynamic data) =>
      _mockSaveSecureCall().thenAnswer((invocation) async => data);
  void mockSaveError(dynamic except) => _mockSaveSecureCall().thenThrow(except);
}
