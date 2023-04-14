import 'package:mobile_authentication/mobile_authentication.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthentication extends Mock implements LoginUsecase {
  When _mockAuthenticateCall() => when(() => authenticate(
      username: any(named: "username"), password: any(named: "password")));
  void mockAuthenticate(Account data) =>
      _mockAuthenticateCall().thenAnswer((_) async => data);
  void mockAuthenticateError(DomainError error) =>
      _mockAuthenticateCall().thenThrow(error);
}
