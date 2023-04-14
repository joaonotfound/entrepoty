import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_customers/data/data.dart';
import 'package:mobile_remote/main/http_factory.dart';
import 'package:mobile_remote/main/main.dart';

RemoteLoadUniqueCustomer makeRemoteLoadUniqueCustomer() {
  return RemoteLoadUniqueCustomer(
    httpClient: makeFunctionalHttpAdapter(),
    url: BackendUrls.customers,
  );
}
