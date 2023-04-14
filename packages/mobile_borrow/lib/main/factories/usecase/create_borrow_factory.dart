import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../data/data.dart';

RemoteCreateBorrow makeRemoteCreateBorrow() {
  return RemoteCreateBorrow(
    client: makeFunctionalHttpAdapter(),
    url: BackendUrls.borrows,
  );
}
