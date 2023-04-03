import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/src/either.dart';

class RemoteCreateProductModel implements CreateProductModelUsecase {
  HttpClient client;
  String url;

  RemoteCreateProductModel({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, ProductModelEntity>> createModel(
    ProductModelEntity model,
  ) async {
    try {
      final response = await client.post(
        url: url,
        body: {
          "name": model.name,
        },
      );
      if (response.statuscode == 200) {
        return Either.right(model);
      }
      if (response.statuscode == 409) {
        return Either.left(DomainError.accountAlreadyExists);
      }
    } catch (e) {}
    return Either.left(DomainError.unexpected);
  }
}
