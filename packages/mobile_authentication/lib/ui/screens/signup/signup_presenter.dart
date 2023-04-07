import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';


abstract class SignupPresenter implements Listenable {
  Stream<String?> get nameErrorStream;
  Stream<String?> get usernameErrorStream;
  Stream<String?> get passwordErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;

  void validateName(String name);
  void validateUsername(String username);
  void validatePassword(String password);

  Future<void> signup();

  void dispose();
}
