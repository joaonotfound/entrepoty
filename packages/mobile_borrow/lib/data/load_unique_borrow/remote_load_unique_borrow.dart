import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteLoadUniqueBorrow implements LoadUniqueBorrowUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteLoadUniqueBorrow({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, BorrowEntity>> loadBorrowById(int id) async {
    final eitherResponse = await client.get(url: '$url/$id');
    return eitherResponse.fold(
      (error) => error.asDomainErrorEither(),
      (response) => Either.right(
        BorrowEntity.fromJson(response.body),
      ),
    );
  }
}
