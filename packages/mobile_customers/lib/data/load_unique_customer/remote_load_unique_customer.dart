import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/errors/domain_errors.dart';
import 'package:mobile_customers/domain/domain.dart';
import 'package:mobile_remote/domain/domain.dart';

class RemoteLoadUniqueCustomer implements LoadUniqueCustomerUsecase {
  HttpClient httpClient;
  String url;

  RemoteLoadUniqueCustomer({
    required this.httpClient,
    required this.url,
  });

  Future<Either<DomainError, CustomerEntity>> loadUniqueCustomer(
    String enrollment,
  ) async {
    try {
      final response = await httpClient.get(url: "$url/$enrollment");
      if(response.statuscode == 200){
        return Either.right(CustomerEntity.fromJson(response.body));
      }
      if(response.statuscode == 409){
        return Either.left(DomainError.notFound);
      }
    }catch (e){}
    return Either.left(DomainError.unexpected);
  }
}
