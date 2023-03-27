import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';

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
