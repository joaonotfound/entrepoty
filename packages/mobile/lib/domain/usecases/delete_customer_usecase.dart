import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';

abstract class RemoveCustomerUsecase {
  Future<Either<DomainError, dynamic>> deleteCustomer(String enrollment);
}
