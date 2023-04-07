import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../data/data.dart';

RemoteCreateProduct makeRemoteCreateProduct() {
  return RemoteCreateProduct(
    client: makeHttpAdapter(),
    url: BackendUrls.products,
  );
}
