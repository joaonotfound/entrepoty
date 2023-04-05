import 'package:flutter/foundation.dart';

import 'backend_presenter.dart';

class BackendProvider extends ChangeNotifier {
  BackendPresenter presenter;

  BackendProvider({
    required this.presenter,
  });

  String loadResource(String resource){
    return presenter.getResource(resource);
  }
}
