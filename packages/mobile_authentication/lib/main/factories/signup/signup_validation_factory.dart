import 'package:mobile_core/mobile_core.dart';

ValidationComposite makeSignupValidationComposite() {
  return ValidationComposite(validators: [
    const UsernameFormFieldValidator(field: 'username'),
    const RequiredFormFieldValidator(field: 'name'),
    const RequiredFormFieldValidator(field: 'username'),
    const RequiredFormFieldValidator(field: 'password'),
  ],);
}
