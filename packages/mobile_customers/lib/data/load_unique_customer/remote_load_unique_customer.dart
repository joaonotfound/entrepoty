
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/errors/domain_errors.dart';
import 'package:mobile_customers/domain/domain.dart';

class RemoteLoadUniqueCustomer implements LoadUniqueCustomerUsecase {
  @override
  Future<Either<DomainError, CustomerEntity>> loadUniqueCustomer(String enrollment) {
    // TODO: implement loadUniqueCustomer
    throw UnimplementedError();
  }
  
}