import 'package:get/get.dart';
import 'package:mobile_authentication/domain/domain.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../mobile_settings.dart';

class GetxSettingsPresenter extends GetxController
    with GetxNavigatorManager
    implements SettingsPresenter {
  late LogoutUsecase usecase;
  GetxSettingsPresenter({
    required this.usecase,
  });
  @override
  Future<void> logout() async {
    await usecase.logout();
    navigateTo = Routes.splash;
  }
}
