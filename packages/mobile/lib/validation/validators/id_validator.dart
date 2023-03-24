import '../validation.dart';

class IdValidator implements FormFieldValidator {
  @override
  final String field;
  const IdValidator({required this.field});
  @override
  String? validate(String? value) {
    return value == null || value.isEmpty
        ? null
        : (value.length < 7 ? "matrícula inválida, mínimo 7 dígitos" : null);
  }
}
