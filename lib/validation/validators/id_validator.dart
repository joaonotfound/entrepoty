import 'package:service_desk_2/validation/validator.dart';

class IdValidator implements Validator {
  @override
  final String field;
  const IdValidator({required this.field});
  @override
  String? validate(String? value) {
    return value == null || value.isEmpty
        ? null
        : (value.length == 10 ? "matrícula inválida" : null);
  }
}
