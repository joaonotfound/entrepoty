import 'package:entrepoty/presentation/presenters/getx_settings_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  late GetxSettingsPresenter sut;
  late LogoutMock logout;
  setUp(() {
    logout = LogoutMock();
    sut = GetxSettingsPresenter(usecase: logout);
  });

  group("GetxSettingsPresenter", () {
    test("should call logout method", () {
      sut.logout();

      verify(() => logout.logout()).called(1);
    });
  });
}
