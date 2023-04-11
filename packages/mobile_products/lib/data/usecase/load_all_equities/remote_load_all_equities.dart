import 'package:fpdart/fpdart.dart';

import 'package:mobile_core/domain/errors/domain_errors.dart';
import 'package:mobile_remote/domain/domain.dart';

import '../../../domain/domain.dart';

class RemoteLoadAllEquities extends LoadAllEquitiesUsecase {
  HttpClient client;
  String url;

  RemoteLoadAllEquities({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, List<ProductDetailWithProduct>>> load() async {
    try {
      final response = await client.get(url: url);
      if (response.statuscode == 200) {
        final List<dynamic> list = response.body;
        return Either.right(
            list.map((e) => ProductDetailWithProduct.fromJson(e)).toList());
      }
    } catch (e) {}
    return Either.left(DomainError.unexpected);
  }
}
