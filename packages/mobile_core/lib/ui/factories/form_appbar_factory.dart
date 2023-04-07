import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar makeFormAppbar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w400),
    ),
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(FluentIcons.dismiss_20_regular),
    ),
  );
}
