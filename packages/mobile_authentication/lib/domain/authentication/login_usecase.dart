import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';

abstract class LoginUsecase {
  Future<Either<DomainError, Account>> authenticate({
    required String username,
    required String password,
  });
}
