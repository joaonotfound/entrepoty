import 'package:mobile_core/backend_urls.dart';
import 'package:mobile_core/mobile_core.dart';

class ImplBackendPresenter implements BackendPresenter {

  String getResource(String resource) {
    return "${BackendUrls.complete(resource)}";
  }
}