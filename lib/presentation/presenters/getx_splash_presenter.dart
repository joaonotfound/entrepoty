import 'package:get/get.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';
import 'package:service_desk_2/ui/ui.dart';

class GetxSplashPresenter extends SplashPresenter {
  final _navigateTo = RxString("");
  final LoadCurrentAccountUsecase loadAccount;

  GetxSplashPresenter({required this.loadAccount});

  @override
  Future<void> checkAccount() async {
    try {
      var account = await loadAccount.load();
      _navigateTo.value = account != null ? "/stock" : "/login";
    } catch (_) {
      _navigateTo.value = "/login";
    }
  }

  @override
  Stream<String?> get navigateToStream => _navigateTo.stream;
}
