import 'package:entrepoty/validation/validation.dart';

class EmailFieldValidator implements FormFieldValidator {
  String field;

  EmailFieldValidator({
    required this.field,
  });

  @override
  String? validate(String? value) {
    final regexp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    return regexp.hasMatch(value ?? '') == true ? null : "Invalid e-mail.";
  }
}
