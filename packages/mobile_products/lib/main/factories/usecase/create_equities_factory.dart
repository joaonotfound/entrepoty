import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_remote/main/http_factory.dart';
import 'package:mobile_remote/main/main.dart';

import '../../../data/data.dart';

RemoteCreateEquities makeRemoteCreateEquities() {
  return RemoteCreateEquities(
    client: makeFunctionalHttpAdapter(),
    url: "${BackendUrls.models}/details",
  );
}
