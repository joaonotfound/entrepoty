import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_authentication/mobile_authentication.dart';
import 'package:mocktail/mocktail.dart';

import '../../mobile_core/mobile_core.dart';

void main() {
  late LocalLogout sut;
  late MockSaveSecureCacheStorage storage;

  setUp(() {
    storage = MockSaveSecureCacheStorage();
    storage.mockSaveSecure(null);
    sut = LocalLogout(storage: storage);
  });

  group('LocalLogout', () {
    test('should call saveSecureStorage with correct values', () {
      sut.logout();

      verify(() => storage.saveSecure(key: 'token', value: '')).called(1);
    });
  });
}
