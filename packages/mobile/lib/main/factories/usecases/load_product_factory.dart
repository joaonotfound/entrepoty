import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/backend_urls.dart';
import 'package:entrepoty/main/factories/factories.dart';

RemoteLoadProduct makeRemoteLoadProduct() {
  return RemoteLoadProduct(
    client: makeHttpAdapter(),
    url: BackendUrls.products,
  );
}
