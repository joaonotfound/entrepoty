import '../../../../validation/validation.dart';

ValidationComposite makeLoginValidationComposite() {
  return ValidationComposite(validators: const [
    RequiredFieldValidator(field: "id"),
    IdValidator(field: "id"),
    RequiredFieldValidator(field: "password")
  ]);
}
