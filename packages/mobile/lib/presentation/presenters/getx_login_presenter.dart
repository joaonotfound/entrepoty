// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../domain/domain.dart';
import '../../presentation/presentation.dart';
import '../../ui/ui.dart';

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
    try {
      final account = await authentication.authenticate(
          username: _username, password: _password);
      await saveCurrentAccount.saveAccount(account: account);
      navigateTo = Routes.home;
    } on DomainError catch (error) {
      mainError = fromDomain(error);
    } catch (error) {
      mainError = UiError.unexpected;
      debugPrint("error: " + error.toString());
    }
    isLoading = false;
  }
}
