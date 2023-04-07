import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';
import '../../../data/data.dart';

RemoteLoadProductModels makeRemoteLoadProductModels() {
  return RemoteLoadProductModels(
    client: makeHttpAdapter(),
    url: BackendUrls.models,
  );
}
