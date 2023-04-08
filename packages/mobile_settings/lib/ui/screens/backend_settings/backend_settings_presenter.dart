import 'package:flutter/cupertino.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class BackendSettingsPresenter {
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Stream<String?> get domainErrorStream;

  TextEditingController get domainTextController;
  TextEditingController get portTextController;

  String? validateDomain(String value);
  String? validatePort(int value);

  Future<void> loadCurrentSettings();
  Future<void> saveCurrentSettings();
}
