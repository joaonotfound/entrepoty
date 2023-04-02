import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class SaveUserUsercase {
  Future<Either<DomainError, CustomerEntity>> saveUser(CustomerEntity account);
}
