import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import '../entitites/entities.dart';

abstract class SaveCustomerUsercase {
  Future<Either<DomainError, CustomerEntity>> saveCustomer(
      CustomerEntity account,);
}
