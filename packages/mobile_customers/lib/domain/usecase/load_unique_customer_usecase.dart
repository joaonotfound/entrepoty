import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';
import 'package:mobile_customers/domain/domain.dart';

abstract class LoadUniqueCustomerUsecase {
  Future<Either<DomainError, CustomerEntity>> loadUniqueCustomer(
      String enrollment);
}
