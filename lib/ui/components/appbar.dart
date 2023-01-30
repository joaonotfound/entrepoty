import 'package:flutter/material.dart';

AppBar getAppbar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    leading: Icon(Icons.menu),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))],
  );
}
