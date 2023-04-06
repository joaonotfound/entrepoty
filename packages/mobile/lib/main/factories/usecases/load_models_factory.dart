import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/main.dart';

RemoteLoadProductModels makeRemoteLoadProductModels() {
  return RemoteLoadProductModels(
    client: makeHttpAdapter(),
    url: BackendUrls.models,
  );
}
