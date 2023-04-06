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
      print(url);
      final response = await client.get(url: "$url/$id");
      if(response.statuscode == 200){
        return Either.right(ProductModelEntity.fromJson(response.body));
      }
    }catch(e){}

    return Either.left(DomainError.unexpected);
  }
}
