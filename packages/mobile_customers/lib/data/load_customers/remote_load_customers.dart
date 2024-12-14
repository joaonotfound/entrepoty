import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteLoadCustomers implements LoadCustomersUsecase {
  FunctionalHttpClientUsecase client;
  String url;

  RemoteLoadCustomers({
    required this.client,
    required this.url,
  });

  @override
  Future<List<CustomerEntity>> loadCustomers() async {
      final eitherResponse = await client.get<List<dynamic>>(url: url);
      return eitherResponse.fold((_) => [], (httpResponse){
        List<CustomerEntity> response = [];
        for (var json in httpResponse.body ?? []) {
          response.add(CustomerEntity.fromJson(json));
        }
        return response;
      });
  }
}
