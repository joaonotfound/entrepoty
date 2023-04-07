import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

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
        return Either.left(DomainError.accountAlreadyExists);
      }
    } catch (e) {}
    return Either.left(DomainError.unexpected);
  }
}
