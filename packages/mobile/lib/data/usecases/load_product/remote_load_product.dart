import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

class RemoteLoadProduct implements LoadProductsUsecase {
  HttpClient client;
  String url;

  RemoteLoadProduct({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, List<ProductEntity>>> loadProducts() async {
    try {
      final httpResponse = await client.get<List<dynamic>>(url: url);
      List<ProductEntity> response = [];
      for (var json in httpResponse.body ?? []) {
        response.add(ProductEntity.fromJson(json));
      }
      return Either.right(response);
    } catch (e) {
      return Either.left(DomainError.unexpected);
    }
  }
}
