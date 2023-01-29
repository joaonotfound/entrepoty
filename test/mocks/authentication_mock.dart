import 'package:mocktail/mocktail.dart';

import 'package:service_desk_2/domain/domain.dart';

class MockAuthentication extends Mock implements AuthenticationUsecase {
  When _mockAuthenticateCall() => when(() =>
      authenticate(id: any(named: "id"), password: any(named: "password")));
  void mockAuthenticate(Account data) =>
      _mockAuthenticateCall().thenAnswer((_) async => data);
  void mockAuthenticateError(DomainError error) =>
      _mockAuthenticateCall().thenThrow(error);
}
