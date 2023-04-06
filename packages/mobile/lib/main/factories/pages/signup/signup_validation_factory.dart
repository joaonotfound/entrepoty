import 'package:entrepoty/validation/validation.dart';

ValidationComposite makeSignupValidationComposite() {
  return ValidationComposite(validators: [
    UsernameFieldValidator(field: "username"),
    RequiredFieldValidator(field: "name"),
    RequiredFieldValidator(field: "username"),
    RequiredFieldValidator(field: "password")
  ]);
}
