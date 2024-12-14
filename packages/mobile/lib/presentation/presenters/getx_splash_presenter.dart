import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

class GetxSplashPresenter extends GetxController
    with GetxNavigatorManager
    implements SplashPresenter {
  final LoadCurrentAccountUsecase loadAccount;

  GetxSplashPresenter({
    required this.loadAccount,
  });

  @override
  Future<void> checkAccount() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final account = await loadAccount.load();
      navigateTo = account != null ? Routes.home : Routes.launch;
    } catch (_) {
      navigateTo = Routes.launch;
    }
  }
}
