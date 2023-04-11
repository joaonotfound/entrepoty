import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_products_model/data/data.dart';
import 'package:mobile_remote/main/http_factory.dart';

RemoteCreateEquities makeRemoteCreateEquities() {
  return RemoteCreateEquities(
    client: makeHttpAdapter(),
    url: "${BackendUrls.models}/details",
  );
}
