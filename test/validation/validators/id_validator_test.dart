import 'package:flutter_test/flutter_test.dart';
import 'package:service_desk_2/validation/validator.dart';
import 'package:service_desk_2/validation/validators/validators.dart';

void main() {
  late Validator sut;
  setUp(() {
    sut = const IdValidator(field: "any_field");
  });
  test("should return null if value is null", () {
    expect(sut.validate(null), null);
  });
  test("should return null if value is empty", () {
    expect(sut.validate(''), null);
  });
  test("should return invalid id if value is invalid", () {
    expect(sut.validate("invalid_id"), "matrícula inválida");
  });
}
