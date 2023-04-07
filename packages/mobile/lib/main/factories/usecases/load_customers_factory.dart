import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_remote/mobile_remote.dart';

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
