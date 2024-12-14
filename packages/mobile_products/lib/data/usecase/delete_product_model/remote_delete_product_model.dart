import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteDeleteProductModel implements DeleteProductModelUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteDeleteProductModel({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, ProductModelEntity>> deleteModel(int id) async {
    final eitherResponse = await client.delete(url: url, body: {'id': id});
    return eitherResponse.fold(
      (error) => error.asDomainErrorEither(),
      (response) => Either.right(ProductModelEntity.fromJson(response.body)),
    );
  }
}
