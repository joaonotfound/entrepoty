import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:service_desk_2/domain/domain.dart';
import 'package:service_desk_2/presentation/presentation.dart';

import '../../mocks/mocks.dart';

void main() {
  late GetxSplashPresenter sut;
  late MockLoadCurrentAccount loadCurrentAccount;
  var validTokenAccount = TokenAccount(token: faker.guid.guid());

  setUp(() {
    loadCurrentAccount = MockLoadCurrentAccount();
    loadCurrentAccount.mockLoad(validTokenAccount);
    sut = GetxSplashPresenter(loadAccount: loadCurrentAccount);
  });

  test("should call loadCurrentAccount", () async {
    await sut.checkAccount();

    verify(() => loadCurrentAccount.load()).called(1);
  });
  test(
      "should correct emit navigateTo if loadCurrentAccount returns an account",
      () async {
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/home')));

    await sut.checkAccount();
  });
  test("should correct emit navigateTo if loadCurrentAccount returns null",
      () async {
    loadCurrentAccount.mockLoad(null);

    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));

    await sut.checkAccount();
  });
  test("should redirect to login page if loadCurrentAccount throws", () async {
    loadCurrentAccount.mockLoadError(Exception());

    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));

    await sut.checkAccount();
  });
}
