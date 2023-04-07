import 'package:entrepoty/data/data.dart';
import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_remote/mobile_remote.dart';

RemoteLoadUniqueBorrow makeRemoteLoadUniqueBorrow() {
  return RemoteLoadUniqueBorrow(
    client: makeHttpAdapter(),
    url: BackendUrls.borrows,
  );
}
