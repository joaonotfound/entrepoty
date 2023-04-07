import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';
import '../../../data/data.dart';

RemoteLoadUniqueProductModel makeRemoteLoadUniqueProductModel() {
  return RemoteLoadUniqueProductModel(
    client: makeHttpAdapter(),
    url: BackendUrls.models,
  );
}
