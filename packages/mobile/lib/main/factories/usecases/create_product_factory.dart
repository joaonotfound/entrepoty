import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/main.dart';

RemoteCreateProduct makeRemoteCreateProduct() {
  return RemoteCreateProduct(
    client: makeHttpAdapter(),
    url: BackendUrls.products,
  );
}
