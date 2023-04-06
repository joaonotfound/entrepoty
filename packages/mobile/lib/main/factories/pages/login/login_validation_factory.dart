import '../../../../validation/validation.dart';

ValidationComposite makeLoginValidationComposite() {
  return ValidationComposite(validators: const [
    UsernameFieldValidator(field: "username"),
    RequiredFieldValidator(field: "username"),
    RequiredFieldValidator(field: "password")
  ]);
}
