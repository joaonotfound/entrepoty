// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:get/get.dart';

import '../../domain/domain.dart';
import '../../presentation/presentation.dart';
import '../../ui/ui.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Validation validator;
  final AuthenticationUsecase authentication;

  GetxLoginPresenter({
    required this.validator,
    required this.authentication,
  });

  final _idError = RxString('');
  final _passwordError = RxString('');
  final _mainError = RxString('');
  final _isLoading = false.obs;
  final _isFormValid = false.obs;

  String _id = '';
  String _password = '';

  @override
  Stream<String?> get idErrorStream => _idError.stream;

  @override
  Stream<String?> get passwordErrorStream => _passwordError.stream;

  @override
  Stream<bool> get isFormValidStream => _isFormValid.stream;

  @override
  Stream<bool> get isLoadingStream => _isLoading.stream;

  @override
  Stream<String?> get mainErrorStream => _mainError.stream;

  void _validateForm() {
    _isFormValid.value = _idError.value == '' &&
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
    _isLoading.value = true;
    try {
      await authentication.authenticate(id: _id, password: _password);
    } on DomainError catch (error) {
      _mainError.value = error.description;
    }
    _isLoading.value = false;
  }

  @override
  void dispose() {}
}
