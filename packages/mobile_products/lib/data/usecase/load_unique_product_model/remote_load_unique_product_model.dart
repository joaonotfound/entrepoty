import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteLoadUniqueProductModel implements LoadUniqueProductModelUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteLoadUniqueProductModel({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, UniqueProductEntity>> loadModelById(int id) async {
    final eitherReponse = await client.get(url: '$url/$id');
    return eitherReponse.fold(
      (error) => error.asDomainErrorEither(),
      (response) => Either.right(
        UniqueProductEntity.fromJson(response.body),
      ),
    );
  }
}
