import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';

import '../mixins/mixins.dart';

class GetxSignupPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxFormManager,
        GetxUiErrorManager,
        GetxNavigatorManager
    implements SignupPresenter {
  Validation validation;
  GetxSignupPresenter({
    required this.validation,
  });

  final _nameError = RxString('');
  Stream<String?> get nameErrorStream => _nameError.stream;

  final _usernameError = RxString('');
  Stream<String?> get usernameErrorStream => _usernameError.stream;

  Stream<String?> get passwordErrorStream => throw UnimplementedError();

  @override
  Future<void> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  void validateName(String name) {
    _nameError.value = validation.validate(field: "name", value: name) ?? "";
  }

  @override
  void validatePassword(String password) {
    // TODO: implement validatePassword
  }

  @override
  void validateUsername(String username) {
    _usernameError.value =
        validation.validate(field: "username", value: username) ?? "";
  }
}
