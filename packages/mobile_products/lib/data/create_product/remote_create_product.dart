import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteCreateProduct implements CreateProductUsecas {
  HttpClient client;
  String url;

  RemoteCreateProduct({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, ProductEntity>> createProduct({
    required int model,
    required int quantity,
    required String receiptPath,
  }) async {
    try {
      final response = await client.post(
        url: url,
        body: {
          "model": model,
          "quantity": quantity,
        },
      );

      if (response.statuscode == 200) {
        return Either.right(ProductEntity.fromJson(response.body));
      }
      if (response.statuscode == 409) {
        return Either.left(DomainError.conflict);
      }
    } catch (e) {}
    return Either.left(DomainError.unexpected);
  }
}
