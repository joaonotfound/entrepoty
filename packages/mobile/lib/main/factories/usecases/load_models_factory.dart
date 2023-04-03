import 'package:entrepoty/data/usecases/load_product_models/remote_load_product_models.dart';
import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/main/main.dart';

RemoteLoadProductModels makeRemoteLoadProductModels() {
  return RemoteLoadProductModels(
    client: makeHttpAdapter(),
    url: BackendUrls.models,
  );
}
