import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/backend_urls.dart';
import 'package:entrepoty/main/factories/factories.dart';

RemoteDeleteProductModel makeRemoteDeleteProductModel() {
  return RemoteDeleteProductModel(
    client: makeHttpAdapter(),
    url: BackendUrls.models,
  );
}
