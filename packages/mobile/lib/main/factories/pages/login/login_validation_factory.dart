import '../../../../validation/validation.dart';

ValidationComposite makeLoginValidationComposite() {
  return ValidationComposite(validators: const [
    UsernameValidator(field: "username"),
    RequiredFieldValidator(field: "password")
  ]);
}
