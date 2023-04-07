import 'package:mobile_remote/mobile_remote.dart';

import '../../domain/domain.dart';

class RemoteLoadCustomers implements LoadCustomersUsecase {
  HttpClient client;
  String url;

  RemoteLoadCustomers({
    required this.client,
    required this.url,
  });

  Future<List<CustomerEntity>> loadCustomers() async {
    try {
      final httpResponse = await client.get<List<dynamic>>(url: url);
      List<CustomerEntity> response = [];
      for (var json in httpResponse.body ?? []) {
        response.add(CustomerEntity.fromJson(json));
      }
      return response;
    } catch (e) {}
    return [];
  }
}
