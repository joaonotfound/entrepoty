import '../validation.dart';

class UsernameFormFieldValidator implements FormFieldValidator {
  @override
  final String field;
  const UsernameFormFieldValidator({required this.field});
  @override
  String? validate(String? value) {
    final usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{4,}$');
    return usernameRegExp.hasMatch(value ?? '') ? null : 'Invalid username.';
  }
}
