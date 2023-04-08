import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_settings/mobile_settings.dart';
import 'package:mocktail/mocktail.dart';

import '../../mobile_authentication/domain/domain.dart';

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
