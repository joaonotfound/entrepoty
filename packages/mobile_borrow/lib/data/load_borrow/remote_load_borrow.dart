import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteLoadBorrow implements LoadBorrowUsecase {
  FunctionalHttpClientUsecase client;
  String url;
  RemoteLoadBorrow({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, List<BorrowEntity>>> loadAll() async {
      final eitherResponse = await client.get<List<dynamic>>(url: url);

      List<BorrowEntity> functionResponse = [];
      return eitherResponse.fold((error) => error.asDomainErrorEither() , (response) {
        for (var json in response.body ?? []) {
          functionResponse.add(BorrowEntity.fromJson(json));
        }
        return Either.right(functionResponse);
      });
  }
}
