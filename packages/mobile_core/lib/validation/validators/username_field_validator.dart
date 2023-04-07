import '../validation.dart';

class UsernameFieldValidator implements FormFieldValidator {
  @override
  final String field;
  const UsernameFieldValidator({required this.field});
  @override
  String? validate(String? value) {
    final usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{4,}$');
    return usernameRegExp.hasMatch(value ?? '') ? null : "Invalid username.";
  }
}
