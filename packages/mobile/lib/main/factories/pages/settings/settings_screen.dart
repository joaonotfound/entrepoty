import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presenters/getx_settings_presenter.dart';
import 'package:entrepoty/ui/screens/screens.dart';

SettingsScreen makeSettingsScreen() {
  return SettingsScreen(
    presenter: GetxSettingsPresenter(
      usecase: makeLocalLogout(),
    ),
  );
}
