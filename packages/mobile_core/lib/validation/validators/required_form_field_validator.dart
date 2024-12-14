import '../../validation/validation.dart';

class RequiredFormFieldValidator implements FormFieldValidator {
  @override
  final String field;
  const RequiredFormFieldValidator({
    required this.field,
  });

  @override
  String? validate(String? value) {
    return value == null || value.isEmpty == true
        ? 'This field is mandatory'
        : null;
  }
}
