import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_settings/mobile_settings.dart';

class GetxBackendSettingsPresenter extends GetxController
    with GetxLoadingManager, GetxUiErrorManager, GetxFormManager
    implements BackendSettingsPresenter {

  final domainTextController = TextEditingController();
  final portTextController = TextEditingController();

  Validation validation;

  GetxBackendSettingsPresenter({
    required this.validation,
  });

  String? domainValidator(String? value) {
    return null;
  }

  @override
  Future<void> loadCurrentSettings() {
    // TODO: implement loadCurrentSettings
    throw UnimplementedError();
  }

  @override
  Future<void> saveCurrentSettings() {
    // TODO: implement saveCurrentSettings
    throw UnimplementedError();
  }
}
