import 'package:mocktail/mocktail.dart';

import 'package:entrepoty/domain/domain.dart';

class MockAuthentication extends Mock implements AuthenticationUsecase {
  When _mockAuthenticateCall() => when(() => authenticate(
      username: any(named: "username"), password: any(named: "password")));
  void mockAuthenticate(Account data) =>
      _mockAuthenticateCall().thenAnswer((_) async => data);
  void mockAuthenticateError(DomainError error) =>
      _mockAuthenticateCall().thenThrow(error);
}
