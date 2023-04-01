import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class SignupUsecase {
  Future<Either<Account, DomainError>> register({
    required String name,
    required String username,
    required String password,
  });
}
