import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteSaveCustomer implements SaveCustomerUsercase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteSaveCustomer({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, CustomerEntity>> saveCustomer(
    CustomerEntity account,
  ) async {
    final eitherResponse = await client.post(
      url: url,
      body: {
        'enrollment': account.enrollment,
        'name': account.name,
        'email': account.email,
        'sector': account.sector,
      },
    );
    return eitherResponse.fold(
      (error) => error.asDomainErrorEither(),
      (response) => Either.right(
        CustomerEntity.fromJson(response.body),
      ),
    );
  }
}
