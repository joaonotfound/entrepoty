import 'package:entrepoty/data/cache/cache.dart';
import 'package:entrepoty/infra/infra.dart';
import 'package:entrepoty/presentation/protocols/theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  late SecureCacheStorageMock storage;
  late Theme sut;

  setUp(() {
    storage = SecureCacheStorageMock();
    storage.mockLoadSecure(null);
    storage.mockSaveSecure(null);
    sut = LocalTheme(storage: storage);
  });

  group("LocalTheme", () {
    test("should call loadSecure", () async {
      await sut.loadIsDark();

      verify(() => storage.loadSecure(key: "is-dark")).called(1);
    });

    test("should return true", () async {
      storage.mockLoadSecure("true");

      var response = await sut.loadIsDark();

      expect(response, true);
    });
    test("should return false", () async {
      storage.mockLoadSecure("any-other-value");

      var response = await sut.loadIsDark();

      expect(response, false);
    });
  });
}
