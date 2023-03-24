import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {
  When _mockWriteCall() =>
      when(() => write(key: any(named: "key"), value: any(named: "value")));
  void mockWrite(dynamic data) =>
      _mockWriteCall().thenAnswer((invocation) async => data);
  void mockWriteError(dynamic error) => _mockWriteCall().thenThrow(error);

  When _mockReadCall() => when(() => read(key: any(named: "key")));
  void mockRead(String? data) =>
      _mockReadCall().thenAnswer((invocation) async => data);
  void mockReadError(dynamic error) => _mockReadCall().thenThrow(error);
}
