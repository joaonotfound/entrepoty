import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/domain/domain.dart';
import 'package:service_desk_2/infra/infra.dart';

import '../../mocks/mocks.dart';

void main() {
  late LocalStorageAdapter sut;
  late MockFlutterSecureStorage secureStorage;
  setUp(() {
    secureStorage = MockFlutterSecureStorage();
    secureStorage.mockWrite(null);
    secureStorage.mockRead(null);
    sut = LocalStorageAdapter(secureStorage: secureStorage);
  });
  group("LocalStorageAdapter", () {
    test("should call save secure with correct values", () async {
      await sut.saveSecure(key: "any-key", value: "any-value");

      verify(() => secureStorage.write(key: "any-key", value: "any-value"))
          .called(1);
    });
    test("should call load with correct values", () async {
      await sut.loadSecure(key: "any-key");

      verify(() => secureStorage.read(key: "any-key")).called(1);
    });
    test("should throw DomainError.unexpected if secureStorage throws",
        () async {
      secureStorage.mockWriteError(Exception());

      var future = sut.saveSecure(key: "any-key", value: "any-value");

      expect(future, throwsA(DomainError.unexpected));
    });
    test("should throw DomainError.unexpected if secureStorage read throws",
        () async {
      secureStorage.mockReadError(Exception());

      var future = sut.loadSecure(key: "any-key");

      expect(future, throwsA(DomainError.unexpected));
    });

    test("should returns what secureStorage returns", () async {
      secureStorage.mockRead('any-response');

      var future = await sut.loadSecure(key: "any-key");

      expect(future, 'any-response');
    });
  });
}
