import 'package:flutter_test/flutter_test.dart';
import 'package:service_desk_2/validation/validation.dart';

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
  test("should return invalid  if value is invalid", () {
    expect(sut.validate("invalid_id"), "matrícula inválida");
  });
  test("should return null if value doesnt have 10 caracteres", () {
    expect(sut.validate("ma-00000-0"), "matrícula inválida");
  });
}
