import 'dart:convert';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/src/either.dart';

class RemoteLoadProductModels implements LoadProductModelsUsecase {
  HttpClient client;
  String url;
  RemoteLoadProductModels({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, List<ProductModelEntity>>> loadModels() async {
    try {
      final httpResponse = await client.get(url: url);
      final listable = json.decode(httpResponse.body) as List;
      List<ProductModelEntity> response = [];
      for (var json in listable) {
        response.add(ProductModelEntity.fromJson(json));
      }
      return Either.right(response);
    } catch (e) {
      return Either.left(DomainError.unexpected);
    }
  }
}
