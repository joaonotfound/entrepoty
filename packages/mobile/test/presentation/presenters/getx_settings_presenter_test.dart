import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/misc/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/domain.dart';

void main() {
  late GetxSettingsPresenter sut;
  late LogoutMock logout;
  setUp(() {
    logout = LogoutMock();
    logout.mockLogout(null);
    sut = GetxSettingsPresenter(usecase: logout);
  });

  group("GetxSettingsPresenter", () {
    test("should call logout method", () async {
      await sut.logout();

      verify(() => logout.logout()).called(1);
    });
    test("should redirect to splash screen", () async {
      sut.navigateToStream
          .listen(expectAsync1((route) => expect(route, Routes.splash)));

      await sut.logout();
    });
  });
}
