import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/data/usecases/usecases.dart';

import '../../../mocks/mocks.dart';

void main() {
  late LocalLoadCurrentAccount sut;
  late MockLoadSecureCacheStorage loadSecureCacheStorage;

  setUp(() {
    loadSecureCacheStorage = MockLoadSecureCacheStorage();
    loadSecureCacheStorage.mockLoadSecure('');
    sut =
        LocalLoadCurrentAccount(loadSecureCacheStorage: loadSecureCacheStorage);
  });
  group("LocalLoadCurrentAccount", () {
    test("should call loadSecureCache with correct values", () async {
      await sut.load();
      verify(() => loadSecureCacheStorage.loadSecure(key: "token")).called(1);
    });
  });
}
