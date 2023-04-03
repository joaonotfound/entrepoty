import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class RemoveCustomerUsecase {
  Future<Either<DomainError, dynamic>> deleteCustomer(String enrollment);
}
