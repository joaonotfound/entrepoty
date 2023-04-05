import 'backend_presenter.dart';

class BackendProvider {
  BackendPresenter presenter;

  BackendProvider({
    required this.presenter,
  });

  String loadResource(String resource){
    return presenter.getResource(resource);
  }
}
