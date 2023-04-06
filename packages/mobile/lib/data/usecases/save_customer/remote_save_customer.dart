import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

class RemoteSaveCustomer implements SaveCustomerUsercase {
  HttpClient client;
  String url;

  RemoteSaveCustomer({
    required this.client,
    required this.url,
  });

  Future<Either<DomainError, CustomerEntity>> saveCustomer(
    CustomerEntity account,
  ) async {
    try {
      final response = await client.post(
        url: url,
        body: {
          "enrollment": account.enrollment,
          "name": account.name,
          "email": account.email,
          "sector": account.sector
        },
      );

      if (response.statuscode == 409) {
        return Either.left(DomainError.accountAlreadyExists);
      }

      return Either.right(CustomerEntity.fromJson(response.body));
    } catch (e) {
      return Either.left(DomainError.unexpected);
    }
  }
}
