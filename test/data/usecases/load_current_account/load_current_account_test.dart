import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/data/usecases/usecases.dart';
import 'package:service_desk_2/domain/entities/authentication/authentication.dart';
import 'package:service_desk_2/domain/errors/domain_errors.dart';

import '../../../mocks/mocks.dart';

void main() {
  late LocalLoadCurrentAccount sut;
  late MockLoadSecureCacheStorage loadSecureCacheStorage;

  setUp(() {
    loadSecureCacheStorage = MockLoadSecureCacheStorage();
    loadSecureCacheStorage.mockLoadSecure('any-token');
    sut =
        LocalLoadCurrentAccount(loadSecureCacheStorage: loadSecureCacheStorage);
  });
  group("LocalLoadCurrentAccount", () {
    test("should call loadSecureCache with correct values", () async {
      await sut.load();
      verify(() => loadSecureCacheStorage.loadSecure(key: "token")).called(1);
    });
    test("should throw Unexpected if secureCacheStorage throws", () async {
      loadSecureCacheStorage.mockLoadError(Exception());

      var future = sut.load();

      expect(future, throwsA(DomainError.unexpected));
    });
    test("should return tokenAccount on sucess", () async {
      var account = await sut.load();

      expect(account, isInstanceOf<TokenAccount>());
    });
    test("should return null if secureCacheStorage returns null", () async {
      loadSecureCacheStorage.mockLoadSecure(null);

      var account = await sut.load();

      expect(account, null);
    });
  });
}
