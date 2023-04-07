import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

class SignupUsecaseMock extends Mock implements SignupUsecase {
  When mockSignupCall() => when(() => register(name: any(named: "name"), username: any(named: "username"), password: any(named: "password")));
  void mockSignup(Either<Account, DomainError> response) => mockSignupCall().thenAnswer((invocation) async => response);
}
