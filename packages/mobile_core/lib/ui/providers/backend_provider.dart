import 'package:flutter/material.dart';
import 'backend_presenter.dart';

class BackendProvider extends ChangeNotifier {
  BackendPresenter presenter;

  BackendProvider({
    required this.presenter,
  });

  Future<String> loadResource(String resource){
    return presenter.getResource(resource);
  }
}
