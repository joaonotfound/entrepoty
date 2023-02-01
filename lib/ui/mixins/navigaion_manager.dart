import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin NavigationManager {
  void handleNavigation(BuildContext context, Stream stream) {
    stream.listen((page) {
      if (page?.isNotEmpty == true) {
        Get.offAllNamed(page!);
      }
    });
  }
}
