import '../validation.dart';

class EmailFormFieldValidator implements FormFieldValidator {
  String field;

  EmailFormFieldValidator({
    required this.field,
  });

  @override
  String? validate(String? value) {
    final regexp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    return regexp.hasMatch(value ?? '') == true ? null : "Invalid e-mail.";
  }
}
