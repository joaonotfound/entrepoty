import 'package:fpdart/src/either.dart';
import 'package:mobile_core/domain/errors/domain_errors.dart';
import 'package:mobile_products/domain/domain.dart';
import 'package:mobile_remote/domain/domain.dart';

class RemoteLoadUniqueProduct implements LoadUniqueProductUsecase {
  HttpClient client;
  String url;

  RemoteLoadUniqueProduct({
    required this.client,
    required this.url
  });

  @override
  Future<Either<DomainError, UniqueProductEntity>> loadUniqueProduct(int id) async {
    try {
      final response = await client.get(url: "$url/id");
      if(response.statuscode == 200){
        return Either.right(UniqueProductEntity.fromJson(response.body));
      }
    } catch(e){}
    return Either.left(DomainError.unexpected);
  }

}