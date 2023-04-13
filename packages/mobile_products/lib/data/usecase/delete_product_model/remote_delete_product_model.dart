import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteDeleteProductModel implements DeleteProductModelUsecase {
  HttpClient client;
  String url;
  RemoteDeleteProductModel({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, ProductModelEntity>> deleteModel(int id) async {
    try {
      final response = await client.delete(url: url, body: {
        "id": id,
      });
      if (response.statuscode == 200) {
        return Either.right(
          ProductModelEntity.fromJson(response.body),
        );
      }
      if (response.statuscode == 409) {
        return Either.left(DomainError.notFound);
      }
    } catch (e) {}

    return Either.left(DomainError.unexpected);
  }
}