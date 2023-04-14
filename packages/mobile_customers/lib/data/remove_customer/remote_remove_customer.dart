import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteRemoveCustomer implements RemoveCustomerUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteRemoveCustomer({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, dynamic>> deleteCustomer(String enrollment) async {
    final eitherResponse = await client.delete(
      url: url,
      body: {"enrollment": enrollment},
    );

    return eitherResponse.fold(
      (error) => error.asDomainErrorEither(),
      (_) => Either.right(null),
    );
  }
}
