import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class LoginPresenter implements Listenable {
  Stream<String?> get usernameErrorStream;
  Stream<String?> get passwordErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;

  void validateUsername(String id);
  void validatePassword(String password);
  Future<void> authenticate();
  void dispose();
}
