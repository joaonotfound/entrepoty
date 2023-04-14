import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteCreateBorrow implements CreateBorrowUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteCreateBorrow({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, BorrowEntity>> create({
    required String equity,
    required int customer,
    required DateTime date,
  }) async {
    final dateformat = DateFormat("yyyy-MM-dd");

    final body = {
      "equity": equity,
      "customer": customer,
      "date": dateformat.format(date).toString()
    };

    final responseEither = await client.post(url: url, body: body);
    return responseEither.fold(
      (error) => error.asDomainErrorEither(),
      (response) => Either.right(
        BorrowEntity.fromJson(response.body),
      ),
    );
  }
}
