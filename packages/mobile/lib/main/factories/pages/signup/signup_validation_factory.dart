import 'package:entrepoty/validation/validation.dart';

ValidationComposite makeSignupValidationComposite() {
  return ValidationComposite(validators: [
    UsernameValidator(field: "username"),
    RequiredFieldValidator(field: "name"),
    RequiredFieldValidator(field: "password")
  ]);
}
