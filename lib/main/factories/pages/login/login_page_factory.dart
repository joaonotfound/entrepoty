import 'package:flutter/material.dart';
import 'package:service_desk_2/main/factories/factories.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

Widget makeLoginScreen() {
  var loginPresenter = makeGetxLoginPresenter();
  return LoginScreen(presenter: loginPresenter);
}
