import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

class MockValidator extends Mock implements FormFieldValidator {
  When _mockValidateCall() => when(() => validate(any()));
  void mockValidate(String response) =>
      _mockValidateCall().thenReturn(response);
}
