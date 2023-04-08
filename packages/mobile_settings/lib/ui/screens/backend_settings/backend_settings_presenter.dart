import 'package:flutter/cupertino.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class BackendSettingsPresenter {
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;

  TextEditingController get domainTextController;
  TextEditingController get portTextController;

  String? domainValidator(String? value);

  Future<void> loadCurrentSettings();
  Future<void> saveCurrentSettings();
}
