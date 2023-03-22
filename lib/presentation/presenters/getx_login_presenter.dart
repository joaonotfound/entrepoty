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
  final AuthenticationUsecase authentication;
  final SaveCurrentAccountUsecase saveCurrentAccount;
  GetxLoginPresenter({
    required this.validator,
    required this.authentication,
    required this.saveCurrentAccount,
  });

  final _idError = RxString('');
  final _passwordError = RxString('');

  String _id = '';
  String _password = '';

  @override
  Stream<String?> get idErrorStream => _idError.stream;

  @override
  Stream<String?> get passwordErrorStream => _passwordError.stream;

  void _validateForm() {
    isFormValid = _idError.value == '' &&
        _id != '' &&
        _passwordError.value == '' &&
        _password != '';
  }

  @override
  void validateId(String id) {
    _id = id;
    _idError.value = validator.validate(field: 'id', value: id) ?? '';
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
      final account =
          await authentication.authenticate(id: _id, password: _password);
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
