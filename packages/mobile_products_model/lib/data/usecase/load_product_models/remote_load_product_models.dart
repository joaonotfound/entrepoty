import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

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
