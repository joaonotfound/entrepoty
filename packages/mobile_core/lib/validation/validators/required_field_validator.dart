import '../../validation/validation.dart';

class RequiredFieldValidator implements FormFieldValidator {
  @override
  final String field;
  const RequiredFieldValidator({
    required this.field,
  });

  @override
  String? validate(String? value) {
    return value == null || value.isEmpty == true
        ? "This field is mandatory"
        : null;
  }
}
