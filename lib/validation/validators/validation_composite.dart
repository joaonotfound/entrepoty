import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/validation/validation.dart';

class ValidationComposite extends Validation {
  final List<Validator> validators;
  ValidationComposite({
    required this.validators,
  });
  @override
  String? validate({required String field, required String value}) {
    for (var validator in validators.where((v) => v.field == field)) {
      String? error = validator.validate(value);
      if (error != null && error.isNotEmpty) {
        return error;
      }
    }
    return null;
  }
}
