import 'package:entrepoty/data/data.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

RemoteCreateProduct makeRemoteCreateProduct() {
  return RemoteCreateProduct(
    client: makeHttpAdapter(),
    url: BackendUrls.products,
  );
}
