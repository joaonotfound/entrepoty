import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/main.dart';

RemoteLoadBorrow makeRemoteLoadBorrow() {
  return RemoteLoadBorrow(
    client: makeHttpAdapter(),
    url: BackendUrls.borrows,
  );
}
