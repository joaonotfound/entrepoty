import 'package:mobile_authentication/mobile_authentication.dart';
import 'package:mocktail/mocktail.dart';

class LogoutMock extends Mock implements LogoutUsecase {
  When mockLogoutCall() => when(() => logout());
  void mockLogout(response) =>
      mockLogoutCall().thenAnswer((invocation) async => response);
}
