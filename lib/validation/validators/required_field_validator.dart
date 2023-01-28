import 'package:service_desk_2/validation/validator.dart';

class RequiredFieldValidator implements Validator {
  final String field;
  const RequiredFieldValidator({
    required this.field,
  });

  @override
  String validate(String? value) {
    return "Campo obrigatório.";
  }
}
