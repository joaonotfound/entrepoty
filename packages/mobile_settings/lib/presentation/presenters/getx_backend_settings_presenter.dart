import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_settings/mobile_settings.dart';

class GetxBackendSettingsPresenter extends GetxController
    with GetxLoadingManager, GetxUiErrorManager, GetxFormManager
    implements BackendSettingsPresenter {
  LoadCurrentBackendSettings loadCurrentBackendSettings;
  SaveCurrentBackendSetings saveCurrentBackendSetings;
  Validation validation;

  GetxBackendSettingsPresenter({
    required this.loadCurrentBackendSettings,
    required this.saveCurrentBackendSetings,
    required this.validation,
  });

  @override
  final portTextController = TextEditingController();
  @override
  final domainTextController = TextEditingController();

  final domainError = Rx<String?>('');
  @override
  Stream<String?> get domainErrorStream => domainError.stream;

  void _validateForm (){
    isFormValid = portTextController.text != '' && domainTextController.text != '';
  }

  @override
  String? validateDomain(String value) {
    domainError.value = validation.validate(field: 'domain', value: value);
    _validateForm();
    return null;
  }

  @override
  String? validatePort(int value) {
    _validateForm();
    return null;
  }
  
  @override
  Future<void> loadCurrentSettings() async {
    isLoading = true;
    final response =
        await loadCurrentBackendSettings.loadCurrentBackendSettings();
    response.fold((_) {}, (settings) {
      domainTextController.text = settings.domain;
      portTextController.text = settings.port.toString();
    });
    isLoading = false;
  }

  @override
  Future<void> saveCurrentSettings() async {
    isLoading = true;
    await saveCurrentBackendSetings.saveCurrentBackendSettings(
      BackendSettings(
        domain: domainTextController.text,
        port: int.parse(portTextController.text),
      ),

    );
    isLoading = false;
    Get.back();
  }
}
