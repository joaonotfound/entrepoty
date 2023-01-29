import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:service_desk_2/data/data.dart';
import 'package:service_desk_2/domain/domain.dart';

import '../../../mocks/mocks.dart';

void main() {
  late LocalSaveCurrentAccount sut;
  late MockSaveSecureCacheStorage saveSecureCacheStorage;

  final account = Account(
    token: faker.guid.guid(),
    id: "random-id",
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

  test("should call saveSecureCacheStorage with correct values", () {
    sut.saveAccount(account: account);
    verify(() => saveSecureCacheStorage.saveSecure(
        key: "token", value: account.token)).called(1);
  });
}
