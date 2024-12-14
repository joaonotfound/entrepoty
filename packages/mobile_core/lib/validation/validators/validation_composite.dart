

import '../../presentation/presentation.dart';
import '../validation.dart';

class ValidationComposite extends Validation {
  final List<FormFieldValidator> validators;
  ValidationComposite({
    required this.validators,
  });
  @override
  String? validate({required String field, required String value}) {
    for (final validator in validators.where((v) => v.field == field)) {
      final String? error = validator.validate(value);
      if (error != null && error.isNotEmpty) {
        return error;
      }
    }
    return null;
  }
}
