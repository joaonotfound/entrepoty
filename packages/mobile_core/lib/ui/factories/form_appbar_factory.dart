import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar makeFormAppbar(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w400),
    ),
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(FluentIcons.dismiss_20_regular),
    ),
  );
}
