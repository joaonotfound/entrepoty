import 'package:flutter/material.dart';
import '../../../../ui/ui.dart';
import '../../main.dart';

Widget makeLoginScreen() {
  final loginPresenter = makeGetxLoginPresenter();
  return LoginScreen(presenter: loginPresenter);
}
