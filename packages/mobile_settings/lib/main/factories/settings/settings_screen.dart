
import 'package:mobile_authentication/mobile_authentication.dart';

import '../../../presentation/presentation.dart';
import '../../../ui/screens/screens.dart';

SettingsScreen makeSettingsScreen() {
  return SettingsScreen(
    presenter: GetxSettingsPresenter(
      usecase: makeLocalLogout(),
    ),
  );
}
