import 'package:entrepoty/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  late LocalLogout sut;
  late MockSaveSecureCacheStorage storage;

  setUp(() {
    storage = MockSaveSecureCacheStorage();
    storage.mockSaveSecure(null);
    sut = LocalLogout(storage: storage);
  });

  group("LocalLogout", () {
    test("should call saveSecureStorage with correct values", () {
      sut.logout();

      verify(() => storage.saveSecure(key: "token", value: "")).called(1);
    });
  });
}
