import 'package:fpdart/fpdart.dart';

import 'package:mobile_core/domain/errors/domain_errors.dart';
import 'package:mobile_remote/domain/domain.dart';

import '../../../domain/domain.dart';

class RemoteLoadAllEquities extends LoadAllEquitiesUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteLoadAllEquities({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, List<ProductDetailWithProduct>>> load() async {
    final eitherResponse = await client.get(url: url);
    return eitherResponse.fold(
      (error) => error.asDomainErrorEither(),
      (response) {
        final List<dynamic> list = response.body;
        return Either.right(
            list.map((e) => ProductDetailWithProduct.fromJson(e)).toList(),);
      },
    );
  }
}
