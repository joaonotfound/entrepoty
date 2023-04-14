import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteLoadProductModels implements LoadProductModelsUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteLoadProductModels({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, List<ProductModelEntity>>> loadModels() async {
    final eitherResponse = await client.get<List<dynamic>>(url: url);
    return eitherResponse.fold(
      (error) => error.asDomainErrorEither(),
      (httpResponse) {
        List<ProductModelEntity> response = [];
        for (var json in httpResponse.body ?? []) {
          response.add(ProductModelEntity.fromJson(json));
        }
        return Either.right(response);
      },
    );
  }
}
