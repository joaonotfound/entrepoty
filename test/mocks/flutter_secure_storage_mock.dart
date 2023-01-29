import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {
  When _mockWriteCall() =>
      when(() => write(key: any(named: "key"), value: any(named: "value")));
  void mockWrite(dynamic data) =>
      _mockWriteCall().thenAnswer((invocation) async => data);
  void mockWriteError(dynamic error) => _mockWriteCall().thenThrow(error);
}
