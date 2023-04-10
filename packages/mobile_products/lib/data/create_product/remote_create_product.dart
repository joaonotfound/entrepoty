import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_products/domain/dto/create_product_response.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteCreateProduct implements CreateProductUsecas {
  HttpClient client;
  String url;

  RemoteCreateProduct({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, CreateProductResponse>> createProduct({
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
        print("response: " + response.body.toString());
        return Either.right(CreateProductResponse.fromJson(response.body));
      }
      if (response.statuscode == 409) {
        return Either.left(DomainError.conflict);
      }
    } catch (e) {
      print(e.toString());
    }
    return Either.left(DomainError.unexpected);
  }
}
