import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_settings/mobile_settings.dart';

GetxBackendSettingsPresenter makeGetxBackendSettingsPresenter() {
  return GetxBackendSettingsPresenter(
    loadCurrentBackendSettings: makeLocalLoadCurrentBackendSettings(),
    saveCurrentBackendSetings: makeLocalSaveCurrentBackendSettings(),
    validation: ValidationComposite(
      validators: [const RequiredFieldValidator(field: "domain")],
    ),
  );
}
