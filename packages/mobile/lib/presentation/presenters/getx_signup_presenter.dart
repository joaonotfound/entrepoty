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

  String _name = "";
  final _nameError = RxString('');
  Stream<String?> get nameErrorStream => _nameError.stream;

  String _username = "";
  final _usernameError = RxString('');
  Stream<String?> get usernameErrorStream => _usernameError.stream;

  String _password = "";
  final _passwordError = RxString('');
  Stream<String?> get passwordErrorStream => _passwordError.stream;

  @override
  Future<void> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }

  void _validateForm() {
    isFormValid = _nameError.value == '' &&
        _name != '' &&
        _usernameError.value == '' &&
        _username != '' &&
        _passwordError.value == '' &&
        _password != '';
  }

  @override
  void validateName(String name) {
    _name = name;
    _nameError.value = validation.validate(field: "name", value: name) ?? "";
    _validateForm();
  }

  @override
  void validatePassword(String password) {
    _password = password;
    _passwordError.value =
        validation.validate(field: "password", value: password) ?? "";
    _validateForm();
  }

  @override
  void validateUsername(String username) {
    _username = username;
    _usernameError.value =
        validation.validate(field: "username", value: username) ?? "";
    _validateForm();
  }
}
