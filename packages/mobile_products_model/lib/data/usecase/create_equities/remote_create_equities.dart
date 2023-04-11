import 'package:fpdart/src/either.dart';
import 'package:mobile_core/domain/errors/domain_errors.dart';
import 'package:mobile_products_model/domain/domain.dart';
import 'package:mobile_remote/domain/domain.dart';

class RemoteCreateEquities extends CreateEquitiesUsecase {
  HttpClient client;
  String url;

  RemoteCreateEquities({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, List<ProductDetailEntity>>> createEquities(
      int quantity,
      ProductModelEntity product,) async {
    try {
      final response = await client.post(url: url, body: {
        "product": product.id,
        "quantity": quantity,
      });

      final details = response.body as List<dynamic>? ?? [];
      return Either.right(details.map(
            (detail) => ProductDetailEntity.fromJson(detail),
      ).toList(),);
    } catch (e) {}

    return Either.left(DomainError.unexpected);
  }
}
