import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/src/either.dart';

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
      data: [MultipleData(name: "name", content: model.name)],
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
