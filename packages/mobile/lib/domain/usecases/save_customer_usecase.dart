import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class SaveCustomerUsercase {
  Future<Either<DomainError, CustomerEntity>> saveCustomer(
      CustomerEntity account);
}
