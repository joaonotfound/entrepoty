import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar makeFormAppbar(String title) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(Icons.close),
    ),
  );
}
