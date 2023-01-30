import 'package:flutter/material.dart';

AppBar getAppbar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))],
  );
}
