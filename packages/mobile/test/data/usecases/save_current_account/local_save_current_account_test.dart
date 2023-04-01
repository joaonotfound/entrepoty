import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';

import '../../data.dart';

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
    test("should throw unexpected error if saveSecureCacheStorage throws", () {
      saveSecureCacheStorage.mockSaveError(Exception());

      var future = sut.saveAccount(account: account);

      expectLater(future, throwsA(DomainError.unexpected));
    });
  });
}
