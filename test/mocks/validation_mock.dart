import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/presentation/protocols/validation.dart';

class MockValidation extends Mock implements Validation {
  When _mockValidateCall() => when(
      () => validate(field: any(named: "field"), value: any(named: "value")));
  void mockValidate(String? data) =>
      _mockValidateCall().thenAnswer((_) => data);
}
