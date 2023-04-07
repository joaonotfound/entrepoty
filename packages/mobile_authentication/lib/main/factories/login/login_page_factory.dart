import 'package:flutter/material.dart';
import '../../../../ui/ui.dart';
import '../../main.dart';

Widget makeLoginScreen() {
  var loginPresenter = makeGetxLoginPresenter();
  return LoginScreen(presenter: loginPresenter);
}
