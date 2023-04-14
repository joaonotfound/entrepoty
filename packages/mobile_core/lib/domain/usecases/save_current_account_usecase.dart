import '../domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class SaveCurrentAccountUsecase {
  Future<Either<DomainError, dynamic>> saveAccount({
    required Account account,
  });
}
