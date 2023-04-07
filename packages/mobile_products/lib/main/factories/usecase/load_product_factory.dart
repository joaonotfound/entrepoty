import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../data/data.dart';

RemoteLoadProduct makeRemoteLoadProduct() {
  return RemoteLoadProduct(
    client: makeHttpAdapter(),
    url: BackendUrls.products,
  );
}
