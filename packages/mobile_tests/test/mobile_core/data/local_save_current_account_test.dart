import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../mobile_core.dart';

void main() {
  late LocalSaveCurrentAccount sut;
  late MockSaveSecureCacheStorage saveSecureCacheStorage;

  final account = Account(
    token: faker.guid.guid(),
    username: "random-username",
    name: "random-name",
    profilePictureUrl: faker.internet.httpUrl(),
  );

  setUp(() {
    saveSecureCacheStorage = MockSaveSecureCacheStorage();
    saveSecureCacheStorage.mockSaveSecure(null);
    sut = LocalSaveCurrentAccount(
      saveSecureCacheStorage: saveSecureCacheStorage,
    );
  });
  group("LocalSaveCurrentAccount", () {
    test("should call saveSecureCacheStorage with correct values", () {
      sut.saveAccount(account: account);

      verify(() => saveSecureCacheStorage.saveSecure(
          key: "token", value: account.token)).called(1);
    });
    test("should throw unexpected error if saveSecureCacheStorage throws",
        () async {
      saveSecureCacheStorage.mockSaveError(Exception());

      var response = await sut.saveAccount(account: account);

      expectLater(response, Either.left(DomainError.unexpected));
    });
  });
}
