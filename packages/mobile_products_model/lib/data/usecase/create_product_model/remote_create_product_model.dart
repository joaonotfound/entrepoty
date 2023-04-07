import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteCreateProductModel implements CreateProductModelUsecase {
  HttpClient client;
  String url;

  RemoteCreateProductModel({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, ProductModelEntity>> createModel(
    ProductModelEntity model,
    String image,
  ) async {
    final rawResponse = await client.multiples(
      method: "POST",
      url: url,
      files: [MultipleFile(name: "image", filePath: image)],
      data: [
        MultipleData(name: "name", content: model.name),
        MultipleData(name: "category", content: model.category)
      ],
    );

    print("image: " + image);

    return rawResponse.fold(
      (error) => Either.left(error),
      (response) => response.statuscode == 200
          ? Either.right(model)
          : response.statuscode == 409
              ? Either.left(DomainError.accountAlreadyExists)
              : Either.left(DomainError.unexpected),
    );
  }
}
