import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_remote/mobile_remote.dart';
import '../../../data/data.dart';

RemoteDeleteProductModel makeRemoteDeleteProductModel() {
  return RemoteDeleteProductModel(
    client: makeHttpAdapter(),
    url: BackendUrls.models,
  );
}
