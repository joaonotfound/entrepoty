import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/errors/domain_errors.dart';
import 'package:mobile_customers/domain/domain.dart';
import 'package:mobile_remote/domain/domain.dart';

class RemoteLoadUniqueCustomer implements LoadUniqueCustomerUsecase {
  FunctionalHttpClientUsecase httpClient;
  String url;

  RemoteLoadUniqueCustomer({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<Either<DomainError, CustomerEntity>> loadUniqueCustomer(
    String enrollment,
  ) async {
    final eitherResponse = await httpClient.get(url: '$url/$enrollment');
    return eitherResponse.fold(
      (error) => error.asDomainErrorEither(),
      (response) => Either.right(
        CustomerEntity.fromJson(response.body),
      ),
    );
  }
}
