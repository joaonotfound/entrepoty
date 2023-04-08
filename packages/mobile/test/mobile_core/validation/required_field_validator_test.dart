import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_core/mobile_core.dart';

void main() {
  late RequiredFieldValidator sut;
  setUp(() {
    sut = const RequiredFieldValidator(field: 'any_field');
  });
  group("RequiredFieldValidator", () {
    test("should return error if value is null", () {
      expect(sut.validate(null), "This field is mandatory");
    });
    test("should return error if value is empty", () {
      expect(sut.validate(""), "This field is mandatory");
    });
    test("should return null if valid value", () {
      expect(sut.validate("any_value"), null);
    });
  });
}
