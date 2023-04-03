import 'package:entrepoty/main/backend_urls.dart';
import 'package:entrepoty/main/factories/factories.dart';

import '../../../data/data.dart';

MockedLoadCustomers makeMockedLoadCustomers() {
  return MockedLoadCustomers();
}

RemoteLoadCustomers makeRemoteLoadCustomers() {
  return RemoteLoadCustomers(
    client: makeHttpAdapter(),
    url: BackendUrls.customers,
  );
}
