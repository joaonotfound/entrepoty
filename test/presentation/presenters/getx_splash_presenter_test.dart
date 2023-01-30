import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/domain/entities/authentication/authentication.dart';
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
    await sut.loadCurrentAccount();

    verify(() => loadCurrentAccount.load()).called(1);
  });
}
