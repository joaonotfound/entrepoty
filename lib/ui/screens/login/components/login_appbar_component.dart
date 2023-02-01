import 'package:flutter/material.dart';

AppBar makeLoginAppbarComponent() {
  return AppBar(
    flexibleSpace: const Padding(
      padding: EdgeInsets.all(20.0),
      child: Image(
        image: AssetImage("lib/ui/assets/logo_light.png"),
        fit: BoxFit.contain,
      ),
    ),
    backgroundColor: Colors.white,
    toolbarHeight: 80,
    elevation: 1,
  );
}
