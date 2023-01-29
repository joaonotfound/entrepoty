import 'package:service_desk_2/validation/validators/validator.dart';

class RequiredFieldValidator implements Validator {
  @override
  final String field;
  const RequiredFieldValidator({
    required this.field,
  });

  @override
  String? validate(String? value) {
    return value == null || value.isEmpty == true ? "Campo obrigatório" : null;
  }
}
