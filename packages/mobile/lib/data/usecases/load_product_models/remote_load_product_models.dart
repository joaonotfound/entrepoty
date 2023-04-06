import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

class RemoteLoadProductModels implements LoadProductModelsUsecase {
  HttpClient client;
  String url;
  RemoteLoadProductModels({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, List<ProductModelEntity>>> loadModels() async {
    try {
      final httpResponse = await client.get<List<dynamic>>(url: url);
      List<ProductModelEntity> response = [];
      for (var json in httpResponse.body ?? []) {
        response.add(ProductModelEntity.fromJson(json));
      }
      return Either.right(response);
    } catch (e) {
      print(e.toString());
      return Either.left(DomainError.unexpected);
    }
  }
}
