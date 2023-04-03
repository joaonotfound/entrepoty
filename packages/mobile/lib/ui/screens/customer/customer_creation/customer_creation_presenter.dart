import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../misc/misc.dart';

abstract class CustomerCreationPresenter implements Listenable {
  Stream<String?> get nameErrorStream;
  Stream<String?> get emailErrorStream;
  Stream<String?> get enrollmentErrorStream;

  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;

  void validateName(String name);
  void validateEmail(String email);
  void validateEnrollment(String enrollment);
  void validateSector(String sector);

  Future<void> authenticate();
  void dispose();
}
