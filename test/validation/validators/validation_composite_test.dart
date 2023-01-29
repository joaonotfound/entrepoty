import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/validation/validator.dart';

import '../../mocks/mocks.dart';

class ValidationComposite extends Validation {
  final List<Validator> validators;
  ValidationComposite({
    required this.validators,
  });
  @override
  String? validate({required String field, required String value}) {
    for (var validator in validators) {
      if (validator.field != field) continue;
      String? error = validator.validate(value);
      if (error != null && error.isNotEmpty) {
        return error;
      }
    }
    return null;
  }
}

void main() {
  late ValidationComposite sut;
  late MockValidator validator1;
  late MockValidator validator2;
  setUp(() {
    validator1 = MockValidator();
    validator2 = MockValidator();
    sut = ValidationComposite(validators: [validator1, validator2]);
  });
  test("should return null if vall validators returns null or empty", () {
    when(() => validator1.field).thenReturn("any_field");
    when(() => validator2.field).thenReturn("any_field");
    var response = sut.validate(field: "any_field", value: "value");
    expect(response, null);
  });
  test("should call all validators", () {
    when(() => validator1.field).thenReturn("any_field");
    when(() => validator2.field).thenReturn("any_field");
    sut.validate(field: "any_field", value: "value");
    verify(() => validator1.validate("value")).called(1);
    verify(() => validator2.validate("value")).called(1);
  });
  test("should only call the corrects validators", () {
    when(() => validator1.field).thenReturn("ignore_this_validator");
    when(() => validator2.field).thenReturn("any_field");
    sut.validate(field: "any_field", value: "value");
    verifyNever(() => validator1.validate("value"));
    verify(() => validator2.validate("value")).called(1);
  });
  test("should return the first error", () {
    when(() => validator1.field).thenReturn("ignore_this_field");
    when(() => validator2.field).thenReturn("any_field");
    validator1.mockValidate("ignore_this_error");
    validator2.mockValidate("error");

    var response = sut.validate(field: "any_field", value: "value");

    expect(response, 'error');
  });
}
