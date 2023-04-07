import 'package:mobile_core/mobile_core.dart';

ValidationComposite makeLoginValidationComposite() {
  return ValidationComposite(validators: const [
    UsernameFieldValidator(field: "username"),
    RequiredFieldValidator(field: "username"),
    RequiredFieldValidator(field: "password")
  ]);
}
