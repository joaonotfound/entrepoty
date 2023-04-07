import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class SignupUsecase {
  Future<Either<Account, DomainError>> register({
    required String name,
    required String username,
    required String password,
  });
}
