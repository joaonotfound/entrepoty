import 'package:flutter/material.dart';
import '../../factories.dart';
import '../../../../ui/ui.dart';

Widget makeLoginScreen() {
  var loginPresenter = makeGetxLoginPresenter();
  return LoginScreen(presenter: loginPresenter);
}
