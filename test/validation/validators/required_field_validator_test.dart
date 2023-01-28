import 'package:flutter_test/flutter_test.dart';
import 'package:service_desk_2/validation/validator.dart';
import 'package:service_desk_2/validation/validators/required_field_validator.dart';

void main() {
  late Validator sut;
  setUp(() {
    sut = const RequiredFieldValidator(field: 'any_field');
  });
  test("should return error if value is null", () {
    expect(sut.validate(null), "Campo obrigatório.");
  });
}
