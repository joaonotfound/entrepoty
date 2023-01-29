import 'package:flutter_test/flutter_test.dart';

import 'package:service_desk_2/validation/validation.dart';

void main() {
  late RequiredFieldValidator sut;
  setUp(() {
    sut = const RequiredFieldValidator(field: 'any_field');
  });
  group("RequiredFieldValidator", () {
    test("should return error if value is null", () {
      expect(sut.validate(null), "Campo obrigatório");
    });
    test("should return error if value is empty", () {
      expect(sut.validate(""), "Campo obrigatório");
    });
    test("should return null if valid value", () {
      expect(sut.validate("any_value"), null);
    });
  });
}
