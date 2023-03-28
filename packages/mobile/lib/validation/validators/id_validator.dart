import '../validation.dart';

class UsernameValidator implements FormFieldValidator {
  @override
  final String field;
  const UsernameValidator({required this.field});
  @override
  String? validate(String? value) {
    return value == null || value.isEmpty
        ? null
        : (value.length < 7 ? "Invalid username, minimum 7 digits" : null);
  }
}
