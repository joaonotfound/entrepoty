import 'package:mocktail/mocktail.dart';

import 'package:service_desk_2/validation/validation.dart';

class MockValidator extends Mock implements FormFieldValidator {
  When _mockValidateCall() => when(() => validate(any()));
  void mockValidate(String response) =>
      _mockValidateCall().thenReturn(response);
}
