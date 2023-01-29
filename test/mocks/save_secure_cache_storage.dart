import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/data/data.dart';

class MockSaveSecureCacheStorage extends Mock
    implements SaveSecureCacheStorage {
  When _mockSaveSecureCall() => when(
      () => saveSecure(key: any(named: "key"), value: any(named: "value")));
  void mockSaveSecure(dynamic data) =>
      _mockSaveSecureCall().thenAnswer((invocation) async => data);
}
