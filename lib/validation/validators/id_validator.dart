import 'package:service_desk_2/validation/validator.dart';

class IdValidator implements Validator {
  final String field;
  const IdValidator({required this.field});
  @override
  String? validate(String? value) {
    return value == null || value.isEmpty ? null : "matrícula inválida";
  }
}
