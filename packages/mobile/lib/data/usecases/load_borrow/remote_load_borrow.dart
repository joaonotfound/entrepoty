import 'dart:convert';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/src/either.dart';

class RemoteLoadBorrow implements LoadBorrowUsecase {
  HttpClient client;
  String url;
  RemoteLoadBorrow({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, List<BorrowEntity>>> loadAll() async {
    try {
      final httpResponse = await client.get(url: url);
      final listable = json.decode(httpResponse.body) as List;
      List<BorrowEntity> response = [];
      for (var json in listable) {
        response.add(BorrowEntity.fromJson(json));
      }
      return Either.right(response);
    } catch (e) {
      return Either.left(DomainError.unexpected);
    }
  }
}
