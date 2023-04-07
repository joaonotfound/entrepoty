import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

abstract class SaveCustomerUsercase {
  Future<Either<DomainError, CustomerEntity>> saveCustomer(
      CustomerEntity account);
}
