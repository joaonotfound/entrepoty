import 'package:flutter/material.dart';
import '../../../../ui/ui.dart';
import 'getx_register_lot_factory.dart';

Widget makeRegisterLotScreen() {
  var presenter = makeGetxRegisterLotPresenter();
  return RegisterLotScreen(presenter: presenter);
}
