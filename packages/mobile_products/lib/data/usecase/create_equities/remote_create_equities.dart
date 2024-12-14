import 'package:fpdart/src/either.dart';
import 'package:mobile_core/domain/errors/domain_errors.dart';
import 'package:mobile_remote/domain/domain.dart';

import '../../../domain/domain.dart';

class RemoteCreateEquities extends CreateEquitiesUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteCreateEquities({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, List<ProductDetailEntity>>> createEquities(
      int quantity,
      ProductModelEntity product,) async {
      final eitherResponse = await client.post(url: url, body: {
        'product': product.id,
        'quantity': quantity,
      },);
      return eitherResponse.fold((error) => error.asDomainErrorEither() , (response) {
        final details = response.body as List<dynamic>? ?? [];
        return Either.right(details.map(
              (detail) => ProductDetailEntity.fromJson(detail),
        ).toList(),);
      });
  }
}
