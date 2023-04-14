import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

import '../data/data.dart';

void main() {
  late SecureCacheStorageMock storage;
  late ThemeLoader sut;

  setUp(() {
    storage = SecureCacheStorageMock();
    storage.mockLoadSecure(null);
    storage.mockSaveSecure(null);
    sut = LocalThemeLoader(storage: storage);
  });

  group("LocalThemeLoader", () {
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

      expect(response, true);
    });
    test("should call save method", () async {
      await sut.setIsDark(false);

      verify(
        () => storage.saveSecure(key: "is-dark", value: "false"),
      ).called(1);
    });
  });
}
