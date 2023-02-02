import 'package:get/get.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';
import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/ui/ui.dart';

class GetxSplashPresenter extends GetxController
    with GetxNavigatorManager
    implements SplashPresenter {
  final LoadCurrentAccountUsecase loadAccount;

  GetxSplashPresenter({required this.loadAccount});

  @override
  Future<void> checkAccount() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      var account = await loadAccount.load();
      navigateTo = account != null ? "/home" : "/login";
    } catch (_) {
      navigateTo = "/login";
    }
  }
}
