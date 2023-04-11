import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_products_model/data/data.dart';
import 'package:mobile_remote/mobile_remote.dart';

RemoteLoadAllEquities makeRemoteLoadAllEquities() {
  return RemoteLoadAllEquities(
    client: makeHttpAdapter(),
    url: "${BackendUrls.models}/details",
  );
}
