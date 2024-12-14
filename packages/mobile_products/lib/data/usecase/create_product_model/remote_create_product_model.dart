
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteCreateProductModel implements CreateProductModelUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteCreateProductModel({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, UniqueProductEntity>> createModel(
    ProductModelEntity model,
    int quantity,
    String image,
  ) async {
    final rawResponse = await client.multiples(
      method: 'POST',
      url: url,
      files: [MultipleFile(name: 'image', filePath: image)],
      data: [
        MultipleData(name: 'name', content: model.name),
        MultipleData(name: 'category', content: model.category),
        MultipleData(name: 'quantity', content: quantity.toString()),
      ],
    );

    return rawResponse.fold(
      (error) => error.asDomainErrorEither(),
      (response) => response.statuscode == 200
          ? Either.right(UniqueProductEntity.fromJson(response.body))
          : response.statuscode == 409
              ? Either.left(DomainError.conflict)
              : Either.left(DomainError.unexpected),
    );
  }
}
