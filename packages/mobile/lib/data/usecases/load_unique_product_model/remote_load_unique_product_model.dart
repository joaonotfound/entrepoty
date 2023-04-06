import 'dart:convert';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/src/either.dart';

class RemoteLoadUniqueProductModel implements LoadUniqueProductModelUsecase {
  HttpClient client;
  String url;

  RemoteLoadUniqueProductModel({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, ProductModelEntity>> loadModelById(int id) async {
    try {
      final response = await client.get(url: url + "?domain=$id");
      if(response.statuscode == 200){
        final decodedBody = json.decode(response.body);
        return Either.right(ProductModelEntity.fromJson(decodedBody));
      }
    }catch(e){}

    return Either.left(DomainError.unexpected);
  }
}
