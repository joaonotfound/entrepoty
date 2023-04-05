import 'package:entrepoty/main/backend_urls.dart';
import 'package:entrepoty/ui/providers/backend_presenter.dart';

class ImplBackendPresenter implements BackendPresenter {

  String getResource(String resource) {
    return "${BackendUrls.complete(resource)}";
  }
}