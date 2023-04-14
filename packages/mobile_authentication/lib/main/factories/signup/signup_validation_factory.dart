import 'package:mobile_core/mobile_core.dart';

ValidationComposite makeSignupValidationComposite() {
  return ValidationComposite(validators: [
    UsernameFormFieldValidator(field: "username"),
    RequiredFormFieldValidator(field: "name"),
    RequiredFormFieldValidator(field: "username"),
    RequiredFormFieldValidator(field: "password")
  ]);
}
