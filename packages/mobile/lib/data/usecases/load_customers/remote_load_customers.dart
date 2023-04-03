import 'dart:convert';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';

class RemoteLoadCustomers implements LoadCustomersUsecase {
  HttpClient client;
  String url;

  RemoteLoadCustomers({
    required this.client,
    required this.url,
  });

  Future<List<CustomerEntity>> loadCustomers() async {
    try {
      final httpResponse = await client.get(url: url);
      final listable = json.decode(httpResponse.body) as List;
      List<CustomerEntity> response = [];
      for (var json in listable) {
        response.add(CustomerEntity.fromJson(json));
      }
      return response;
    } catch (e) {}
    return [];
  }
}
