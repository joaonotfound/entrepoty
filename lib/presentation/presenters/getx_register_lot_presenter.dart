import 'package:get/get.dart';
import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class GetxRegisterLotPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxFormManager,
        GetxUiErrorManager,
        GetxNavigatorManager
    implements RegisterLotPresenter {
  final qtdError = RxString('');
  final modelError = RxString('');

  @override
  Stream<String?> get modelErrorStream => modelError.stream;

  @override
  Stream<String?> get qtdErrorStream => qtdError.stream;

  @override
  Future<void> register() async {}

  @override
  void validateForm() {}

  @override
  void validateModel(String value) {
    modelError.value = value.length == 0 ? "Este campo é obrigatório." : "";
  }

  @override
  void validateQtd(int value) {
    qtdError.value = value <= 0 ? "Número inválido." : "";
  }

  Future<void> dispose() async {}
}
