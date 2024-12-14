import 'package:entrepoty/presentation/presentation.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

import '../../mobile_core/mobile_core.dart';

void main() {
  late GetxSplashPresenter sut;
  late MockLoadCurrentAccount loadCurrentAccount;
  final validTokenAccount = TokenAccount(token: faker.guid.guid());

  setUp(() {
    loadCurrentAccount = MockLoadCurrentAccount();
    loadCurrentAccount.mockLoad(validTokenAccount);
    sut = GetxSplashPresenter(loadAccount: loadCurrentAccount);
  });

  test('should call loadCurrentAccount', () async {
    await sut.checkAccount();

    verify(() => loadCurrentAccount.load()).called(1);
  });
  test(
      'should correct emit navigateTo if loadCurrentAccount returns an account',
      () async {
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/home')));

    await sut.checkAccount();
  });
  test('should correct emit navigateTo if loadCurrentAccount returns null',
      () async {
    loadCurrentAccount.mockLoad(null);

    sut.navigateToStream
        .listen(expectAsync1((page) => expect(page, '/launch')));

    await sut.checkAccount();
  });
  test('should redirect to login page if loadCurrentAccount throws', () async {
    loadCurrentAccount.mockLoadError(Exception());

    sut.navigateToStream
        .listen(expectAsync1((page) => expect(page, '/launch')));

    await sut.checkAccount();
  });
}
