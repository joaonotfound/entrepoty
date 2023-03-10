import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/data/data.dart';

class MockLoadSecureCacheStorage extends Mock
    implements LoadSecureCacheStorage {
  When _mockLoadSecureCall() => when(() => loadSecure(key: any(named: "key")));
  void mockLoadSecure(String? data) =>
      _mockLoadSecureCall().thenAnswer((invocation) async => data);
  void mockLoadError(dynamic except) => _mockLoadSecureCall().thenThrow(except);
}
