import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteCreateBorrow implements CreateBorrowUsecase {
  HttpClient client;
  String url;

  RemoteCreateBorrow({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, BorrowEntity>> create({
    required int product,
    required int customer,
    required DateTime date,
  }) async {
    try {
      final dateformat = DateFormat("yyyy-MM-dd");
      final body = {
        "product": product,
        "customer": customer,
        "date": dateformat.format(date).toString()
      };
      print(body);
      final response = await client.post(url: url, body: body);
      print("status-code: " + response.statuscode.toString());
      if (response.statuscode == 200) {
        print("returning...");
        return Either.right(BorrowEntity.fromJson(response.body));
      }
      if (response.statuscode == 409) {
        return Either.left(DomainError.accountAlreadyExists);
      }
    } catch (e) {
      print(e.toString());
    }
    return Either.left(DomainError.unexpected);
  }
}
