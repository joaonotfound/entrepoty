import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../mobile_authentication.dart';

class GetxLoginPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxFormManager,
        GetxUiErrorManager,
        GetxNavigatorManager
    implements LoginPresenter {
  final Validation validator;
  final LoginUsecase authentication;
  final SaveCurrentAccountUsecase saveCurrentAccount;

  GetxLoginPresenter({
    required this.validator,
    required this.authentication,
    required this.saveCurrentAccount,
  });

  final _usernameError = RxString('');
  final _passwordError = RxString('');

  String _username = '';
  String _password = '';

  @override
  Stream<String?> get usernameErrorStream => _usernameError.stream;

  @override
  Stream<String?> get passwordErrorStream => _passwordError.stream;

  void _validateForm() {
    isFormValid = _usernameError.value == '' &&
        _username != '' &&
        _passwordError.value == '' &&
        _password != '';
  }

  @override
  void validateUsername(String username) {
    _username = username;
    _usernameError.value =
        validator.validate(field: 'username', value: username) ?? '';
    _validateForm();
  }

  @override
  void validatePassword(String password) {
    _password = password;
    _passwordError.value =
        validator.validate(field: 'password', value: password) ?? '';
    _validateForm();
  }

  @override
  Future<void> authenticate() async {
    isLoading = true;
    final response = await authentication.authenticate(
      username: _username,
      password: _password,
    );

    response.fold(
      (error) => mainError = fromDomain(error),
      (account) async {
        await saveCurrentAccount.saveAccount(account: account);
        navigateTo = Routes.home;
      },
    );

    isLoading = false;
  }
}
