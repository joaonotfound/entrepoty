import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

class RemoteLoadUniqueBorrow implements LoadUniqueBorrowUsecase {
  HttpClient client;
  String url;

  RemoteLoadUniqueBorrow({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, BorrowEntity>> loadBorrowById(int id) async {
    try {
      final response = await client.get(url: "$url/$id");
      if (response.statuscode == 200) {
        return Either.right(BorrowEntity.fromJson(response.body));
      }
    } catch (e) {}

    return Either.left(DomainError.unexpected);
  }
}
