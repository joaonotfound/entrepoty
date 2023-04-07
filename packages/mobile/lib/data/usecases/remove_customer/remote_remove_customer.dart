import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

class RemoteRemoveCustomer implements RemoveCustomerUsecase {
  HttpClient client;
  String url;

  RemoteRemoveCustomer({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, dynamic>> deleteCustomer(String enrollment) async {
    final response =
        await client.delete(url: url, body: {"enrollment": enrollment});
    if (response.statuscode != 200) {
      return Either.left(DomainError.unexpected);
    }
    return Either.right(null);
  }
}
