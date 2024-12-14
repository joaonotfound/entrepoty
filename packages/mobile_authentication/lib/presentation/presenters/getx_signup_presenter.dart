import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../domain/domain.dart';
import '../../ui/screens/screens.dart';

class GetxSignupPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxFormManager,
        GetxUiErrorManager,
        GetxNavigatorManager
    implements SignupPresenter {
  Validation validation;
  SignupUsecase usecase;
  SaveCurrentAccountUsecase saveAccount;

  GetxSignupPresenter({
    required this.validation,
    required this.usecase,
    required this.saveAccount,
  });

  String _name = "";
  final _nameError = RxString('');

  @override
  Stream<String?> get nameErrorStream => _nameError.stream;

  String _username = "";
  final _usernameError = RxString('');

  @override
  Stream<String?> get usernameErrorStream => _usernameError.stream;

  String _password = "";
  final _passwordError = RxString('');

  @override
  Stream<String?> get passwordErrorStream => _passwordError.stream;

  @override
  Future<void> signup() async {
    isLoading = true;
    try{
      final response = await usecase.register(
          name: _name, username: _username, password: _password);
      response.fold((account) async {
        await saveAccount.saveAccount(account: account);
        navigateTo = Routes.home;
      } , (error) {
        mainError = fromDomain(error);
      });
    } catch (e) {
     mainError = UiError.unexpected;
     debugPrint("error: $e");
    }
    isLoading = false;
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
