import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/backend_urls.dart';
import 'package:entrepoty/main/factories/factories.dart';

RemoteCreateBorrow makeRemoteCreateBorrow() {
  return RemoteCreateBorrow(
    client: makeHttpAdapter(),
    url: BackendUrls.borrows,
  );
}
