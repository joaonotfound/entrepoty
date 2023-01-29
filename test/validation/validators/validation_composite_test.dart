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
      validator.validate(value);
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
    sut = ValidationComposite(
        validators: [validator1, validator2] as List<Validator>);
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
    var response = sut.validate(field: "any_field", value: "value");
    verify(() => validator1.validate("value")).called(1);
    verify(() => validator2.validate("value")).called(1);
  });
}
