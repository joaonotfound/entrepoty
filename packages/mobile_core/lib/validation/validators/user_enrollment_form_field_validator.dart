import '../validation.dart';

class UserEnrollmentFormFieldValidator implements FormFieldValidator {
  @override
  String field;

  UserEnrollmentFormFieldValidator({
    required this.field,
  });

  @override
  String? validate(String? value) {
    final reg = RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$');
    return reg.hasMatch(value ?? '') == true ? null : 'Invalid enrollment';
  }
}
