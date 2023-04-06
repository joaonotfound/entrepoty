import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/main.dart';

RemoteLoadUniqueProductModel makeRemoteLoadUniqueProductModel() {
  return RemoteLoadUniqueProductModel(
    client: makeHttpAdapter(),
    url: BackendUrls.models,
  );
}
