import 'package:entrepoty/validation/validation.dart';

class UserEnrollmentFieldValidator implements FormFieldValidator {
  String field;

  UserEnrollmentFieldValidator({
    required this.field,
  });

  String? validate(String? value) {
    final reg = RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$');
    return reg.hasMatch(value ?? "") == true ? null : "Invalid enrollment";
  }
}
