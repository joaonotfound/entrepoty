import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

class RemoteLoadBorrow implements LoadBorrowUsecase {
  HttpClient client;
  String url;
  RemoteLoadBorrow({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, List<BorrowEntity>>> loadAll() async {
    try {
      final httpResponse = await client.get<List<dynamic>>(url: url);

      List<BorrowEntity> response = [];
      for (var json in httpResponse.body ?? []) {
        response.add(BorrowEntity.fromJson(json));
      }
      return Either.right(response);
    } catch (e) {
      return Either.left(DomainError.unexpected);
    }
  }
}
