import 'package:mobile_core/mobile_core.dart';

ValidationComposite makeLoginValidationComposite() {
  return ValidationComposite(validators: const [
    UsernameFormFieldValidator(field: "username"),
    RequiredFormFieldValidator(field: "username"),
    RequiredFormFieldValidator(field: "password")
  ]);
}
