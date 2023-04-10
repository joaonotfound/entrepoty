import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_remote/main/http_factory.dart';

import '../../../data/data.dart';

RemoteLoadUniqueProduct makeRemoteLoadUniqueProduct() {
  return RemoteLoadUniqueProduct(
    client: makeHttpAdapter(),
    url: BackendUrls.products,
  );
}
