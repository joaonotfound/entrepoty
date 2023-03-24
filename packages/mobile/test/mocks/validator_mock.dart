import 'package:mocktail/mocktail.dart';

import 'package:entrepoty/validation/validation.dart';

class MockValidator extends Mock implements FormFieldValidator {
  When _mockValidateCall() => when(() => validate(any()));
  void mockValidate(String response) =>
      _mockValidateCall().thenReturn(response);
}
