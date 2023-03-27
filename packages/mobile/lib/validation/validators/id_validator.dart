import '../validation.dart';

class IdValidator implements FormFieldValidator {
  @override
  final String field;
  const IdValidator({required this.field});
  @override
  String? validate(String? value) {
    return value == null || value.isEmpty
        ? null
        : (value.length < 7 ? "Invalid ID, minimum 7 digits" : null);
  }
}
