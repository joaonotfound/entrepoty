import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../data/data.dart';

RemoteLoadAllEquities makeRemoteLoadAllEquities() {
  return RemoteLoadAllEquities(
    client: makeFunctionalHttpAdapter(),
    url: '${BackendUrls.models}/details',
  );
}
