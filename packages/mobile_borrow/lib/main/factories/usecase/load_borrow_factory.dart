import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../data/data.dart';

RemoteLoadBorrow makeRemoteLoadBorrow() {
  return RemoteLoadBorrow(
    client: makeHttpAdapter(),
    url: BackendUrls.borrows,
  );
}
