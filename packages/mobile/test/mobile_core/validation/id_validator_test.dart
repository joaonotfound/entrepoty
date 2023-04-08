import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_core/mobile_core.dart';

void main() {
  late UsernameFieldValidator sut;
  setUp(() {
    sut = const UsernameFieldValidator(field: "any_field");
  });
  group("IdValidator", () {
    test("should return null if value is null", () {
      expect(sut.validate(null), 'Invalid username.');
    });
    test("should return null if value is empty", () {
      expect(sut.validate(''), 'Invalid username.');
    });
    test("should return null if id has 10 caracteres", () {
      expect(sut.validate("0123456789"), null);
    });
    test("should return null if id has more than 10 caracteres", () {
      expect(sut.validate("0123456789234"), null);
    });
    test("should return error if value doesnt have 10 caracteres", () {
      expect(sut.validate("12"), "Invalid username.");
    });
  });
}
